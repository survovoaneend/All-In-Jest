-- Used in Vanilla functions where 'type' is overridden
All_in_Jest.aij_alias_type = type

--repurposd from paperback
function jest_poll_tag(seed, options)
  -- This part is basically a copy of how the base game does it
  -- Look at get_next_tag_key in common_events.lua
  local pool = options or get_current_pool('Tag')
  local tag_key = pseudorandom_element(pool, pseudoseed(seed))

  while tag_key == 'UNAVAILABLE' do
    tag_key = pseudorandom_element(pool, pseudoseed(seed))
  end

  local tag = Tag(tag_key)

  -- The way the hand for an orbital tag in the base game is selected could cause issues
  -- with mods that modify blinds, so we randomly pick one from all visible hands
  if tag_key == "tag_orbital" then
    local available_hands = {}

    for _, k in ipairs(G.handlist) do
      local hand = G.GAME.hands[k]
      if hand.visible then
        available_hands[#available_hands + 1] = k
      end
    end

    tag.ability.orbital_hand = pseudorandom_element(available_hands, pseudoseed(seed .. '_orbital'))
  end

  return tag
end

function next_palindrome(n)
    n = math.ceil(n)
    while true do
        local s = tostring(n)
        if s == s:reverse() and #s > 1 then
            return n
        end
        n = math.floor(n + 1)
    end
end

local original_emplace = CardArea.emplace

function CardArea:emplace(card, ...)
    local result = original_emplace(self, card, ...)
    if self == G.jokers and card.ability.set == "Joker" and G.STATE == 5 then
        G.GAME.jest_bought_jokers = (G.GAME.jest_bought_jokers or 0) + 1
    end

    return result
end

-- better temp values
function apply_multiplier(t, key, factor, tag)
    t.temp_mult_val = t.temp_mult_val or {}
    t.temp_mult_val[key] = t.temp_mult_val[key] or {}
    t.temp_mult_val[key][tag] = factor
    update_multiplied_value(t, key)
end

function remove_multiplier(t, key, tag)
    if t.temp_mult_val and t.temp_mult_val[key] then
        t.temp_mult_val[key][tag] = nil
        update_multiplied_value(t, key)
    end
end

function update_multiplied_value(t, key)
    local base = t["base_"..key] or t[key]
    t["base_"..key] = base  -- Save original if not already
    local result = base
    for _, mult in pairs(t.temp_mult_val[key] or {}) do
        result = result * mult
    end
    t[key] = result
end

function retrieve_joker_text(joker, descip, name)
    local function get_text(main)
        local text = ""
        if type(main) == "string" then
            text = text .. main
            return text
        end
        for i = 1, #main do
            if type(main[i]) == "string" then
                text = text .. main[i]
            elseif main[i].config and main[i].config.text and type(main[i].config.text) == "string" then
                text = text .. main[i].config.text

            -- Parses any Dynatext objects
            elseif main[i].config and main[i].config.object and main[i].config.object.config and type(main[i].config.object.config) == "table" and main[i].config.object.config.string then
                local options = main[i].config.object.config.string
                local random_element = main[i].config.object.config.random_element
                local chosen_option = nil
                if random_element then
                    chosen_option = options[pseudorandom('aij_retrieve_joker_text', 1, #options)]
                else
                    chosen_option = options[math.floor((G.TIMERS.REAL or pseudorandom('aij_retrieve_joker_text', 1, 60)) * love.timer.getFPS( ) % #options) + 1]
                end
                if type(chosen_option) == "table" then
                    text = text .. chosen_option.string or get_text(chosen_option)
                else
                    text = text .. chosen_option
                end
            elseif type(main[i]) == "table" then
                -- Parses any text in XMult/XChip/similar blocks
                if main[i].nodes and type(main[i].nodes) == "table" then
                    text = text .. " "
                    text = text .. get_text(main[i].nodes)
                else
                    text = text .. " "
                    text = text .. get_text(main[i])
                end
            end
        end
        return text
    end
    local text = ""
    if name and descip and G.localization.descriptions['Joker'][joker.key or joker] then
        local main = G.localization.descriptions['Joker'][joker.key or joker].name
        text = text .. get_text(main)
        if text and type(text) == 'string' then text = string.gsub(text, "{.-}", "") end
    elseif descip and G.localization.descriptions['Joker'][joker.key or joker] then
        local main = G.localization.descriptions['Joker'][joker.key or joker].text
        text = text .. get_text(main)
        if text and type(text) == 'string' then text = string.gsub(text, "{.-}", "") end
    else
        if joker.generate_UIBox_ability_table then
            if not joker.ability_UIBox_table then -- Removing this check causes memory leaks
                joker.ability_UIBox_table = joker:generate_UIBox_ability_table()
            end
            local main = joker.ability_UIBox_table.main
            text = text .. get_text(main)
            local multi_box = joker.ability_UIBox_table.multi_box
            if multi_box then
                text = text .. " "
                text = text .. get_text(multi_box)
            end
        end
    end
    return text
end

--also repurposed from paperback
function jest_add_tag(tag, event, silent)
  local func = function()
    add_tag(type(tag) == 'string' and Tag(tag) or tag)
    if not silent then
      play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
      play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
    end
    return true
  end

  if event then
    G.E_MANAGER:add_event(Event {
      func = func
    })
  else
    func()
  end
end

function level_up_hand_chips(card, hand, instant, amount)
    amount = amount or 1
    SMODS.upgrade_poker_hands({
        hands = hand,
        func = function(base, hand, parameter)
            return base + G.GAME.hands[hand]['l_' .. parameter] * amount * 2
        end,
        level_up = amount,
        from = card,
        instant = instant,
        parameters = {"chips"}
    })
end

function level_up_hand_mult(card, hand, instant, amount)
    amount = amount or 1
    SMODS.upgrade_poker_hands({
        hands = hand,
        func = function(base, hand, parameter)
            return base + G.GAME.hands[hand]['l_' .. parameter] * amount * 2
        end,
        level_up = amount,
        from = card,
        instant = instant,
        parameters = {"mult"}
    })
end

--local ids_op_ref = ids_op
--function ids_op(card, op, b, c)
--  local id = card:get_id() 
--  local other_results = false
-- if ids_op_ref ~= nil then
--    other_results = ids_op_ref(card, op, b, c) 
--  end

--  local function alias(x)
--    local has_invis, has_doc, has_pygm, has_furb = false, false, false, false

--    if G.jokers and G.jokers.cards then
--      for _, j in ipairs(G.jokers.cards) do
--        local k = j.config and not j.debuff and j.config.center_key
--        if k == "j_aij_invisible_man" then has_invis = true end
--        if k == "j_aij_doctors_note" then has_doc = true end
--        if k == "j_aij_pygmalion" then has_pygm = true end
--        if k == "j_aij_furbo_e_stupido" then has_furb = true end
--      end
--    end

--    if has_invis and (({[11]=true, [12]=true, [13]=true, [id]=true})[b] and card:is_face()) then -- Face cards count as 11-13 ranks
--      return 11
--    end

 --   if has_doc and card:is_suit("Hearts") and not ({[11]=true, [12]=true, [13]=true, [14]=true})[b] then -- Counts as any heart non-face ranks
--      return 11
--    end

--    if has_pygm and ({[12]=true})[b] and SMODS.has_enhancement(card, 'm_stone') and not card.debuff then -- Stone cards count as rank 12
--      return 11
--    end

--    if has_furb then
--        if SMODS.has_enhancement(card, 'm_aij_dyscalcular') and not card.debuff then
--            if id == b or not ({[12]=true, [13]=true})[b] then
--                return 11
--            end
--        end
--    elseif SMODS.has_enhancement(card, 'm_aij_dyscalcular') and not card.debuff then -- Counts as any non-face ranks and non-ace
--        if id == b or not ({[11]=true, [12]=true, [13]=true, [14]=true})[b] then 
--            return 11
--        end
--    end


--    if card.ability.jest_all_rank and not card.debuff then -- Counts as any rank
--      return 11
--    end

--    return x
--  end

--  if other_results == true then
--    return true
--  end

--  if op == "mod" then
--    return (id % b) == c
--  end

--  if op == "==" then
--    local lhs = alias(id)
--    local rhs = alias(b) 
--    return lhs == rhs
--  end
--  if op == "~=" then
--    local lhs = alias(id)
--    local rhs = alias(b) 
--    return lhs ~= rhs
--  end

--  if op == ">=" then return id >= b end
--  if op == "<=" then return id <= b end
--  if op == ">" then return id > b end
--  if op == "<" then return id < b end

--  error("ids_op: unsupported op " .. tostring(op))
--end


function redeemed_voucher_count()
    if G.GAME and G.GAME.used_vouchers then
        local used_voucher = 0
        for k, _ in pairs(G.GAME.used_vouchers) do
            used_voucher = used_voucher + 1
        end
        if used_voucher > 0 then
            return used_voucher
        end
    end
    return 0
end

table.insert(SMODS.calculation_keys, "aij_balance_percent")
if SMODS.other_calculation_keys then
    table.insert(SMODS.other_calculation_keys, "aij_balance_percent")
end
-- table.insert(SMODS.calculation_keys, 1, "aij_balance_percent") -- This version would put the effect at the start, making it go before chip/mult/etc. effects.
local aij_balance_mixed = false
local aij_original_smods_calculate_individal_effect = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    if key == "aij_balance_percent" then
        if amount > 1 then
            amount = 1
        end
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        new_hand_chips, new_mult = calculate_balance_percent_values(hand_chips, mult, amount)

        SMODS.Scoring_Parameters.chips:modify(new_hand_chips - hand_chips)
        SMODS.Scoring_Parameters.mult:modify(new_mult - mult)

        local text = (amount * 100) .. "%"
        -- update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })

        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function()
                -- Mixes the chip and mult colours by the balance%
                ease_colour(G.C.UI_CHIPS, mix_colours({ 0.8, 0.45, 0.85, 1 }, G.C.UI_CHIPS, amount))
                ease_colour(G.C.UI_MULT, mix_colours({ 0.8, 0.45, 0.85, 1 }, G.C.UI_MULT, amount))
                if not aij_balance_mixed then
                    aij_balance_mixed = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        blockable = false,
                        blocking = false,
                        delay = 6.3,
                        func = (function()
                            if G.STATE ~= 2 then
                                ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                                ease_colour(G.C.UI_MULT, G.C.RED, 2)
                                aij_balance_mixed = false
                                return true
                            end
                        end)
                    }))
                end
                return true
            end)
        }))

        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = text, colour = { 0.8, 0.45, 0.85, 1 }, sound = 'gong', edition = true})
            else
                card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, {message = text, colour = { 0.8, 0.45, 0.85, 1 }, sound = 'gong', edition = true})
            end
        end

        return true
    end

    return aij_original_smods_calculate_individal_effect(effect, scored_card, key, amount, from_edition)
end

function calculate_balance_percent_values(input_hand_chips, input_mult, percent)
  local chip_mod = percent * input_hand_chips
  local mult_mod = percent * input_mult
  local avg = (chip_mod + mult_mod)/2
  local new_hand_chips = input_hand_chips + (avg - chip_mod)
  local new_mult = input_mult + (avg - mult_mod)

  return new_hand_chips, new_mult
end

to_big = to_big or function(num)
    return num
end

AllInJest.touchstone_deck_preview = function()
    local touchstone_card = SMODS.find_card('j_aij_touchstone')[1]
    local cards = {}
    for i = #G.deck.cards, #G.deck.cards - touchstone_card.ability.future_sense + 1, -1 do
        if i > 0 then
            local card = copy_card(G.deck.cards[i], nil, nil, G.playing_card)

            -- Re-adds negative to preview if it was stripped by the mod
            if G.deck.cards[i].edition and G.deck.cards[i].edition.negative and not All_in_Jest.config.no_copy_neg then
                card:set_edition({negative = true}, nil, true)
            end

            if G.jokers and touchstone_card.area == G.jokers then
                card.facing = 'front' -- Using .flip() here plays the flipping animation
            end

            table.insert(cards, card)
        end
    end
    return AllInJest.card_area_preview(nil, nil, {
        override = true,
        cards = cards,
        w = 5,
        h = 0.6,
        ml = 0,
        scale = 0.4,
        padding = 0,
    })
end

AllInJest.card_area_preview = function(cardArea, desc_nodes, config)
    if not config then config = {} end
    local height = config.h or 1.25
    local width = config.w or 1
    local card_limit = config.card_limit or #config.cards or 1
    local override = config.override or false
    local cards = config.cards or {}
    local padding = config.padding or 0.07
    local margin_left = config.ml or 0
    local margin_top = config.mt or 0
    local alignment = config.alignment or "cm"
    local scale = config.scale or 1
    local type = config.type or "title"
    local box_height = config.box_height or 0
    local highlight_limit = config.highlight_limit or 0
    local x_offset = config.x_offset or 0
    if override or not cardArea then
        cardArea = CardArea(
            G.ROOM.T.x + margin_left * G.ROOM.T.w - x_offset, G.ROOM.T.h + margin_top
            ,G.CARD_W <= width * G.CARD_W and width * G.CARD_W or G.CARD_W, height * G.CARD_H,
            {card_limit = card_limit, type = type, highlight_limit = highlight_limit, collection = true,temporary = true}
        )
        for i, card in ipairs(cards) do
            card.T.w = card.T.w * scale
            card.T.h = card.T.h * scale
            card.VT.h = card.T.h
            card.VT.h = card.T.h
            local area = cardArea
            if(card.config.center) then
                card:set_sprites(card.config.center)
            end
            area:emplace(card)
        end
    end
    local uiEX = {
        n = G.UIT.R,
        config = { align = alignment , padding = padding, no_fill = true, minh = box_height },
        nodes = {
            {n=G.UIT.R, config={padding = padding, r = 0.12, colour = lighten(G.C.JOKER_GREY, 0.5), emboss = 0.07}, nodes={
                {n = G.UIT.O, config = { object = cardArea }}
            }}
        }
    }
    if cardArea then
        if desc_nodes then
            desc_nodes[#desc_nodes+1] = {
                uiEX
            }
        end
    end
    return uiEX
end

AllInJest.deck_skins = {
  {
    id = 'double_king',
    name = 'Double King',
    suits = {
      'Hearts',
    }
  },
  {
    id = 'balatro',
    name = 'Balatro',
    suits = {
      'Hearts',
    }
  },
  {
    id = 'wuppo',
    name = 'Wuppo',
    suits = {
      'Hearts',
    }
  },
  {
    id = 'spelunky',
    name = 'Spelunky',
    suits = {
      'Diamonds',
    }
  },
  {
    id = 'off',
    name = 'OFF',
    suits = {
      'Spades',
    }
  },
  {
    id = 'portal_two',
    name = 'Portal 2',
    suits = {
      'Spades',
    }
  },
  {
    id = 'talos_principle',
    name = 'Talos Principle',
    suits = {
      'Spades',
    }
  },
  {
    id = 'alan_wake',
    name = 'Alan Wake',
    suits = {
      'Clubs',
    }
  },
  {
    id = 'minecraft',
    name = 'Minecraft',
    suits = {
      'Clubs',
    }
  },
  {
    id = 'petscop',
    name = 'Petscop',
    suits = {
      'Clubs',
    }
  },
  {
    id = 'we_happy_few',
    name = 'We Happy Few',
    suits = {
      'Clubs',
    }
  },
  {
    id = 'king_in_yellow',
    name = 'The King in Yellow',
    suits = {
      'Diamonds',
      'Clubs',
    }
  },
  {
    id = 'inscryption',
    name = 'Inscryption',
    suits = {
      'Clubs',
      'Spades',
      'Hearts',
      'Diamonds'
    }
  },
  {
    id = 'yume_nikki',
    name = 'Yume Nikki',
    suits = {
      'Clubs',
      'Spades',
      'Hearts',
      'Diamonds'
    }
  },
}

--Taken from paperback
function jest_get_unique_suits(scoring_hand, bypass_debuff, flush_calc)
  -- Set each suit's count to 0
  local suits = {}

  for k, _ in pairs(SMODS.Suits) do
    suits[k] = 0
  end

  -- First we cover all the non Wild Cards in the hand
  for _, card in ipairs(scoring_hand) do
    if not SMODS.has_any_suit(card) then
      for suit, count in pairs(suits) do
        if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
          suits[suit] = count + 1
          break
        end
      end
    end
  end

  -- Then we cover Wild Cards, filling the missing suits
  for _, card in ipairs(scoring_hand) do
    if SMODS.has_any_suit(card) then
      for suit, count in pairs(suits) do
        if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
          suits[suit] = count + 1
          break
        end
      end
    end
  end

  -- Count the amount of suits that were found
  local num_suits = 0

  for _, v in pairs(suits) do
    if v > 0 then num_suits = num_suits + 1 end
  end

  return num_suits
end

-- card predict begin
--------------------------------
--------------------------------
local function predicte_pseudrandom(predicte_fn, ...)
    local ante = G.GAME.round_resets.ante
    local used_jokers = copy_table(G.GAME.used_jokers)
    local banned_keys = copy_table(G.GAME.banned_keys)
    local pool = copy_table(G.ARGS.TEMP_POOL)
    local pool_flags = copy_table(G.GAME.pool_flags)
    local random_data = copy_table(G.GAME.pseudorandom)
    local hand_data = copy_table(G.GAME.hands)

    predicte_fn(...)

    G.GAME.round_resets.ante = ante
    G.GAME.used_jokers = used_jokers
    G.GAME.pool_flags = pool_flags
    G.GAME.banned_keys = banned_keys
    G.ARGS.TEMP_POOL = pool
    G.GAME.pseudorandom = random_data
    G.GAME.hands = hand_data
end

local function predicte_cards(booster_pack, create_card_fn)
    local pack_size = booster_pack.ability.extra or G.GAME.pack_size
    booster_pack.ability.jest_selected_shown = booster_pack.ability.jest_selected_shown or math.random(1,pack_size)
    local i = booster_pack.ability.jest_selected_shown
    booster_pack.prediction_cards = {}

    local card = create_card_fn(booster_pack)
    card.T.x = booster_pack.T.x 
    card.T.y = booster_pack.T.y - card.T.h - 0.5
    card:start_materialize({G.C.WHITE, G.C.WHITE}, nil, 1.5 * G.SETTINGS.GAMESPEED)

    booster_pack.prediction_cards[i] = card
end

local function predicte_card(booster_pack) -- Pretty much the card:open code
    local card = nil
    if booster_pack.config.center.create_card and type(booster_pack.config.center.create_card) == "function" then
        local _card_to_spawn = booster_pack.config.center:create_card(booster_pack, i)
        if type((_card_to_spawn or {}).is) == 'function' and _card_to_spawn:is(Card) then
            card = _card_to_spawn
        else
            card = SMODS.create_card(_card_to_spawn)
        end
    elseif booster_pack.ability.name:find('Arcana') then
        if G.GAME.used_vouchers.v_omen_globe and pseudorandom('omen_globe') > 0.8 then
            card = create_card("Spectral", G.pack_cards, nil, nil, true, true, nil, 'ar2')
        else
            card = create_card("Tarot", G.pack_cards, nil, nil, true, true, nil, 'ar1')
        end
    elseif booster_pack.ability.name:find('Celestial') then
        if G.GAME.used_vouchers.v_telescope and i == 1 then
            local _planet, _hand, _tally = nil, nil, 0
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            if _hand then
                for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == _hand then
                        _planet = v.key
                    end
                end
            end
            card = create_card("Planet", G.pack_cards, nil, nil, true, true, _planet, 'pl1')
        else
            card = create_card("Planet", G.pack_cards, nil, nil, true, true, nil, 'pl1')
        end
    elseif booster_pack.ability.name:find('Spectral') then
        card = create_card("Spectral", G.pack_cards, nil, nil, true, true, nil, 'spe')
    elseif booster_pack.ability.name:find('Standard') then
        card = create_card((pseudorandom(pseudoseed('stdset'..G.GAME.round_resets.ante)) > 0.6) and "Enhanced" or "Base", G.pack_cards, nil, nil, nil, true, nil, 'sta')
        local edition_rate = 2
        if G.GAME.modifiers.fam_force_dual then
            notsuit = card.base.suit
            suit = pseudorandom_element({'Spades','Hearts','Diamonds','Clubs'}, pseudoseed('dual_deck'))
            if suit == notsuit then
                while suit == notsuit do
                    suit = pseudorandom_element({'Spades','Hearts','Diamonds','Clubs'}, pseudoseed('dual_deck'))
                end
            end
            if suit == 'Spades' then
                card.ability.is_spade = true
            elseif suit == 'Hearts' then
                card.ability.is_heart = true
            elseif suit == 'Diamonds' then
                card.ability.is_diamond = true
            elseif suit == 'Clubs' then
                card.ability.is_club = true
            end
            set_sprite_suits(card, false)
        end
        local edition = poll_edition('standard_edition'..G.GAME.round_resets.ante, edition_rate, true)
        card:set_edition(edition)
        card:set_seal(SMODS.poll_seal({mod = 10}))
    elseif booster_pack.ability.name:find('Buffoon') then
        card = create_card("Joker", G.pack_cards, nil, nil, true, true, nil, 'buf')
    end
    card.ability.jest_got_no_ui = true
    return card
end

function Card:remove_prediction_card()
    for k, card in pairs(self.prediction_cards or {}) do
        card:remove()
        self.prediction_cards[k] = nil
    end
end

--function get_probability(rnd_val, op, num, den)
    --Maninulate numerator/denominatior here
--    local threshold = num / den
--    local result = false

--   if op == "<" then result = rnd_val < threshold
--   elseif op == "<=" then result = rnd_val <= threshold
--    elseif op == ">" then result = rnd_val > threshold
--    elseif op == ">=" then result = rnd_val >= threshold
--    elseif op == "==" then result = rnd_val == threshold
--    elseif op == "~=" then result = rnd_val ~= threshold
--    else error("bad op: "..tostring(op)) end

--    if result then
--        SMODS.calculate_context({
--            probability_trigger = {result = true, numerator = num, denominator = den}
--        })
--    else
--        SMODS.calculate_context({
--            probability_trigger = {result = false, numerator = num, denominator = den}
--        })
--    end

--    return result
--end

local remove = Card.remove
function Card:remove(...)
    self:remove_prediction_card()
    return remove(self, ...)
end

local _click = Card.click
function Card:click(...)
    if self.area and self.area.config and self.area.config.type == "shop" then
        local has_ultrasound = next(SMODS.find_card("j_aij_ultrasound"))
        if has_ultrasound then
            if self.highlighted then
                self:remove_prediction_card()
            elseif self.config.center.create_card then
                predicte_pseudrandom(predicte_cards, self, predicte_card)
            end
        end
    end

    return _click(self, ...)
end

local _highlight = Card.highlight
function Card:highlight(is_higlighted, ...)
    if not is_higlighted then
        self:remove_prediction_card()
    end
    return _highlight(self, is_higlighted, ...)
end

-------------------------------- 
--------------------------------
-- card predict end 

function Tag:jest_apply(message, _colour, func, statement) -- Play on words just apply
    if statement() then
        stop_use()    

        local temptrigger = false
        G.E_MANAGER:add_event(Event({
            delay = 0.4,
            trigger = 'after',
            func = (function()
                if statement() then
                    attention_text({
                        text = message,
                        colour = G.C.WHITE,
                        scale = 1, 
                        hold = 0.3/G.SETTINGS.GAMESPEED,
                        cover = self.HUD_tag,
                        cover_colour = _colour or G.C.GREEN,
                        align = 'cm',
                        })
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    temptrigger = true
                  end 
                return true
            end)
        }))
        G.E_MANAGER:add_event(Event({
            func = (function()
                if statement() then
                    self.HUD_tag.states.visible = false
                end
                return true
            end)
        }))

        
        G.E_MANAGER:add_event(Event({
            func = func
        }))
    
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = (function()
                if temptrigger then
                    self:remove()
                else
                    self.triggered = false
                end
                return true
            end)
        }))
    end
end

-- Some of my personal functions i use in my projects
function create_consumable(card_type,tag,message,extra, thing1, thing2, immediate, silent)
    extra=extra or {}

    local event_alias
    if immediate then
        event_alias = function (func)
            func()
        end
    else
        event_alias = function (func)
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = func
            }))
        end
    end
    
    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
    event_alias(function()
                local card = create_card(card_type,G.consumeables, nil, nil, thing1, thing2, extra.forced_key or nil, tag)
                card:add_to_deck()
                if extra.edition~=nil then
                    card:set_edition(extra.edition,true,silent)
                end
                if extra.eternal~=nil then
                    card.ability.eternal=extra.eternal
                end
                if extra.perishable~=nil then
                    card.ability.perishable = extra.perishable
                    if tag=='v_epilogue' then
                        card.ability.perish_tally=get_voucher('epilogue').config.extra
                    else card.ability.perish_tally = G.GAME.perishable_rounds
                    end
                end
                if extra.extra_ability~=nil then
                    card.ability[extra.extra_ability]=true
                end
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                if message~=nil then
                    card_eval_status_text(card,'extra',nil,nil,nil,{message=message})
                end
        return true
    end)
end

function create_joker(card_type,tag,message,extra, rarity, immediate)
    extra=extra or {}

    local event_alias
    if immediate then
        event_alias = function (func)
            func()
        end
    else
        event_alias = function (func)
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = func
            }))
        end
    end
    
    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
    event_alias(function()
                local card = create_card(card_type, G.joker, nil, rarity, nil, nil, extra.forced_key or nil, tag)
                card:add_to_deck()
                if extra.edition~=nil then
                    card:set_edition(extra.edition,true,false)
                end
                if extra.eternal~=nil then
                    card.ability.eternal=extra.eternal
                end
                if extra.perishable~=nil then
                    card.ability.perishable = extra.perishable
                    if tag=='v_epilogue' then
                        card.ability.perish_tally=get_voucher('epilogue').config.extra
                    else card.ability.perish_tally = G.GAME.perishable_rounds
                    end
                end
                if extra.extra_ability~=nil then
                    card.ability[extra.extra_ability]=true
                end
                G.jokers:emplace(card)
                G.GAME.joker_buffer = 0
                if message~=nil then
                    card_eval_status_text(card,'extra',nil,nil,nil,{message=message})
                end
        return true
    end)
end

---- All In Jest-specific utility functions

-- return `true` if an effect from All In Jest makes `card` count as all suits
function All_in_Jest.counts_as_all_suits(card)
  if G.jokers then
    local jack_joker = next(SMODS.find_card('j_aij_jack_of_all_trades')) 
    if jack_joker and card.base and card.base.value == 'Jack' then
        return true
    end
    local glass_joker = next(SMODS.find_card('j_aij_stained_glass_joker'))
    local enhancements = SMODS.get_enhancements(card)
    if glass_joker and enhancements['m_glass'] then
        return true
    end
    local fantasio = next(SMODS.find_card('j_aij_fantasio'))
    if fantasio then
      return true
    end
  end
  if card.ability.jest_all_suit then
      return true
  end
end

function All_in_Jest.has_patches(card, suit)
  --Patches
  if card.ability.patches then
      for k, v in pairs(card.ability.patches) do
         if suit and suit == k and v == true then
            return true
         elseif suit == nil and v == true then
            return true
         end
      end
  end
  return false
end

function All_in_Jest.add_patch(card, suit, instant, append)
  if not suit then
    local keys = {}
	  for k, v in pairs(SMODS.Suits) do
      if card.base.suit ~= k and All_in_Jest.has_suit_in_deck(k, true) and ((v.in_pool and v.in_pool(val, nil)) or not v.in_pool) then
        keys[#keys+1] = k
      end
	  end
	  suit = pseudorandom_element(keys, pseudoseed(append or ''))
  end
  instant = instant or false
  if not instant then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function() 
          card.ability.patches = card.ability.patches or {}
          card.ability.patches[suit] = true
          play_sound('tarot1')
          card:juice_up(0.3, 0.5)
          return true
        end
      }))
  else
    card.ability.patches = card.ability.patches or {}
    card.ability.patches[suit] = true
  end
  check_for_unlock({type = 'modify_deck'})
end

function All_in_Jest.has_suit_in_deck(suit, ignore_wild)
  for _, v in ipairs(G.playing_cards or {}) do
    if not SMODS.has_no_suit(v) and (v.base.suit == suit or (not ignore_wild and v:is_suit(suit))) then
      return true
    end
  end
  return false
end

function All_in_Jest.add_tag_to_shop(key, price)
  local center = G.P_TAGS[key]
  center.atlas = center.atlas or 'tags'
  local card = Card(G.shop_aij_tags.T.x, G.shop_aij_tags.T.y, 0.8, 0.8, G.P_CARDS.empty, center, {bypass_discovery_center = true, bypass_discovery_ui = true})
  for k, v in pairs(center.config) do
    card.config[k] = v
  end
  card.ability.booster_pos = #G.shop_aij_tags.cards + 1
  card.ability.is_aij_shop_tag = true
  local pool = options or get_current_pool('Tag')
  local tag_key = key
  local tag = Tag(tag_key)
  if tag_key == "tag_orbital" then
    local available_hands = {}

    for _, k in ipairs(G.handlist) do
      local hand = G.GAME.hands[k]
      if hand.visible then
        available_hands[#available_hands + 1] = k
      end
    end

    tag.ability.orbital_hand = pseudorandom_element(available_hands, pseudoseed(card.ability.booster_pos .. '_orbital'))
    card.ability.orbital_hand = tag.ability.orbital_hand
  end
  card.config.tag = tag
  card.name = card.config.tag.name
  card:start_materialize()
  card.edition = nil
  card.base_cost = price or 1
  card:set_cost()
  card.config.center.set_card_type_badge = function(self, card, badges)
    badges[#badges+1] = create_badge(localize('k_tag'), G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
  end
  create_shop_card_ui(card, 'Tag', G.shop_aij_tags)
  G.shop_aij_tags:emplace(card)
  return card
end

function All_in_Jest.is_food(card)
  local center = type(card) == "string" and G.P_CENTERS[card] or (card.config and card.config.center)

  if not center then
    return false
  end

  if center.pools and center.pools.Food then
    return true
  end

  return All_in_Jest.vanilla_food[center.key]
end

function Card:All_in_Jest_start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice) -- For not triggering on destroy effects
    if self.skip_destroy_animation then
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                self.T.r = -0.2
                self:juice_up(0.3, 0.4)
                self.states.drag.is = true
                self.children.center.pinch.x = true
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                    func = function()
                            G.jokers:remove_card(self)
                            self:remove()
                            self = nil
                        return true; end})) 
                return true
            end
        })) 
        return
    end
    dissolve_colours = dissolve_colours or (type(self.destroyed) == 'table' and self.destroyed.colours) or nil
    dissolve_time_fac = dissolve_time_fac or (type(self.destroyed) == 'table' and self.destroyed.time) or nil
    local dissolve_time = 0.7*(dissolve_time_fac or 1)
    self.dissolve = 0
    self.dissolve_colours = dissolve_colours
        or {G.C.BLACK, G.C.ORANGE, G.C.RED, G.C.GOLD, G.C.JOKER_GREY}
    if not no_juice then self:juice_up() end
    local childParts = Particles(0, 0, 0,0, {
        timer_type = 'TOTAL',
        timer = 0.01*dissolve_time,
        scale = 0.1,
        speed = 2,
        lifespan = 0.7*dissolve_time,
        attach = self,
        colours = self.dissolve_colours,
        fill = true
    })
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  0.7*dissolve_time,
        func = (function() childParts:fade(0.3*dissolve_time) return true end)
    }))
    if not silent then 
        G.E_MANAGER:add_event(Event({
            blockable = false,
            func = (function()
                    play_sound('whoosh2', math.random()*0.2 + 0.9,0.5)
                    play_sound('crumple'..math.random(1, 5), math.random()*0.2 + 0.9,0.5)
                return true end)
        }))
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'ease',
        blockable = false,
        ref_table = self,
        ref_value = 'dissolve',
        ease_to = 1,
        delay =  1*dissolve_time,
        func = (function(t) return t end)
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  1.05*dissolve_time,
        func = (function() self:remove() return true end)
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  1.051*dissolve_time,
    }))
end

function All_in_Jest.reroll_joker(card, key, append, temp_key)
    local victim_joker = card
      
    local victim_rarity = victim_joker.config.center.rarity or 1
    local is_legendary = victim_rarity == 4
    local victim_key = victim_joker.config.center.key

    
    local replacement_pool = {}
    for _, center_data in ipairs(G.P_CENTER_POOLS.Joker) do
        local current_rarity = center_data.rarity or 1
        if current_rarity == victim_rarity then
            if center_data.key ~= victim_key then
                if not center_data.demo and not center_data.wip and (center_data.unlocked or G.GAME.modifiers.all_jokers_unlocked or center_data.rarity == 4) then
                    local can_add = true
                    if center_data.in_pool and type(center_data.in_pool) == 'function' then
                        if not center_data:in_pool() then can_add = false end
                    end
                    if can_add then table.insert(replacement_pool, center_data.key) end
                end
            end
        end
    end

      
    if #replacement_pool == 0 and not key then
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'No replacement found!', colour = G.C.RED })
        return false
    end

    
    local replacement_key = key or pseudorandom_element(replacement_pool, pseudoseed(append..'_replacement'))

    G.E_MANAGER:add_event(Event({
        trigger = 'after', 
        delay = 0.15,
        func = function() 
            victim_joker:flip()
            play_sound('card1', 1)
            victim_joker:juice_up(0.3, 0.3)
            return true 
        end 
    }))
    delay(0.4)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
            local old_ability_data = copy_table(victim_joker.ability)
            victim_joker:set_ability(G.P_CENTERS[replacement_key])
            if old_ability_data.all_in_jest and old_ability_data.all_in_jest.has_been_rerolled_data then
                victim_joker.ability = old_ability_data.all_in_jest.has_been_rerolled_data
                old_ability_data.all_in_jest.has_been_rerolled_data = nil
            end
            if temp_key then
                victim_joker.ability.all_in_jest = victim_joker.ability.all_in_jest or {}
                victim_joker.ability.all_in_jest.has_been_rerolled = temp_key
                victim_joker.ability.all_in_jest.has_been_rerolled_data = old_ability_data
            end
            victim_joker:set_cost()
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function() 
            victim_joker:flip()
            play_sound('tarot2', 1, 0.6)
            victim_joker:juice_up(0.3, 0.3)
            return true 
        end 
    }))
    delay(0.5)
end

function All_in_Jest.set_debuff(card)
	if card.ability and card.ability.all_in_jest and card.ability.all_in_jest.perma_debuff then
		return true
	end
end

-- Should this have an option to check suits in the pool rather then suits that are in the deck?
function All_in_Jest.get_suits(type, base)
    local suits = {}
	for k, v in pairs(G.playing_cards) do
        for key, val in pairs(SMODS.Suits) do
            if not base and v:is_suit(key) then
                suits[key] = suits[key] or 0
                suits[key] = suits[key] + 1
            elseif base and v:is_suit(key) then
                suits[key] = suits[key] or val
            end
        end
    end
    if not type then
        return suits
    end
    local return_table = {}
    if type == 'suit' or type == 'key' then
        for k, v in pairs(suits) do
            return_table[#return_table+1] = k
        end
    elseif type == 'count' or type == 'val' then
        for k, v in pairs(suits) do
            return_table[#return_table+1] = v
        end
    end
    return return_table
end

function reset_jest_magick_joker_card()
    G.GAME.current_round.jest_magick_joker_card.suit = 'Spades'
    local valid_jest_magick_joker_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if v.ability.effect ~= 'Stone Card' then
            valid_jest_magick_joker_cards[#valid_jest_magick_joker_cards+1] = v
        end
    end
    if valid_jest_magick_joker_cards[1] then 
        local jest_magick_joker_card = pseudorandom_element(valid_jest_magick_joker_cards, pseudoseed('mag'..G.GAME.round_resets.ante))
        G.GAME.current_round.jest_magick_joker_card.suit = jest_magick_joker_card.base.suit
    end
end
function reset_jest_you_broke_it_card()
  G.GAME.current_round.jest_you_broke_it_card.rank = 'Ace'
  G.GAME.current_round.jest_you_broke_it_card.enhancement = 'm_bonus'
  local valid_enhancements = get_current_pool("Enhanced")
  local valid_jest_ybi_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if v.ability.effect ~= 'Stone Card' then
            valid_jest_ybi_cards[#valid_jest_ybi_cards+1] = v
        end
    end
    if valid_jest_ybi_cards[1] then 
        local jest_ybi_card = pseudorandom_element(valid_jest_ybi_cards, pseudoseed('ybi'..G.GAME.round_resets.ante))
        G.GAME.current_round.jest_you_broke_it_card.rank = jest_ybi_card.base.value
        G.GAME.current_round.jest_you_broke_it_card.id = jest_ybi_card.base.id
    end
    if valid_enhancements[1] then
      local jest_ybi_enhancement = pseudorandom_element(valid_enhancements, pseudoseed('ybi'..G.GAME.round_resets.ante))
      local it = 1
      while jest_ybi_enhancement == 'UNAVAILABLE' do
        it = it + 1
        jest_ybi_enhancement = pseudorandom_element(valid_enhancements, pseudoseed('ybi'..'_resample'..it))
      end
      G.GAME.current_round.jest_you_broke_it_card.enhancement = jest_ybi_enhancement
    end
end
function reset_handsome_joker_card()
  G.GAME.current_round.jest_handsome_joker_card.rank = 'Ace'
  G.GAME.current_round.jest_handsome_joker_card.suit = 'Spades'
  G.GAME.current_round.jest_handsome_joker_card.enhancement = 'm_bonus'
  local all_enhancements = get_current_pool("Enhanced")
  local valid_enhancements = {}

  -- Loop through the original list of all enhancements
  for _, enhancement in ipairs(all_enhancements) do
    if enhancement ~= "UNAVAILABLE" and not (enhancement == 'm_stone' or enhancement == 'm_aij_canvas' or G.P_CENTERS[enhancement].no_rank or G.P_CENTERS[enhancement].no_suit) then
      valid_enhancements[#valid_enhancements + 1] = enhancement
    end
  end
  local valid_jest_handsome_cards = {}
    for k, v in ipairs(G.playing_cards) do
        local enhancement = v.ability.effect
        if not (SMODS.has_no_rank(v) or SMODS.has_no_suit(v) or enhancement == 'm_aij_canvas') then
            valid_jest_handsome_cards[#valid_jest_handsome_cards+1] = v
        end
    end
    if valid_jest_handsome_cards[1] then 
        local jest_handsome_card = pseudorandom_element(valid_jest_handsome_cards, pseudoseed('handsome'..G.GAME.round_resets.ante))
        G.GAME.current_round.jest_handsome_joker_card.suit = jest_handsome_card.base.suit
        G.GAME.current_round.jest_handsome_joker_card.rank = jest_handsome_card.base.value
        G.GAME.current_round.jest_handsome_joker_card.id = jest_handsome_card.base.id
    end
    if valid_enhancements[1] then
      local jest_handsome_card_enhancement = pseudorandom_element(valid_enhancements, pseudoseed('handsome'..G.GAME.round_resets.ante))
      local it = 1
      while jest_handsome_card_enhancement == 'UNAVAILABLE' do
        it = it + 1
        jest_handsome_card_enhancement = pseudorandom_element(valid_enhancements, pseudoseed('handsome'..'_resample'..it))
      end
      G.GAME.current_round.jest_handsome_joker_card.enhancement = jest_handsome_card_enhancement
    end
end
function reset_the_auroch_blind()
    local common_suit, common_rank = nil, nil
    local temp_suit_val, temp_rank_val = 0, 0
    local suit_table, rank_table = {}, {}
    for _, v in pairs(G.deck.cards) do
        suit_table[v.base.suit] = suit_table[v.base.suit] or 0 
        suit_table[v.base.suit] = suit_table[v.base.suit] + 1
        rank_table[v.base.value] = rank_table[v.base.value] or 0 
        rank_table[v.base.value] = rank_table[v.base.value] + 1
    end
    for k, v in pairs(suit_table) do
        if v >= temp_suit_val then
            temp_suit_val = v
            common_suit = k
        end
    end
    for k, v in pairs(rank_table) do
        if v >= temp_rank_val then
            temp_rank_val = v
            common_rank = k
        end
    end
    G.GAME.current_round.aij_the_auroch = {suit = common_suit or "Spades", rank = common_rank or "Ace"}
end
function reset_the_journey_blind()
    local selected_suit = pseudorandom_element(All_in_Jest.get_suits('key'), pseudoseed('the_journey'))
    -- By default the special journey background will fade during the evaluate screen, nesting events here prevnts this
    -- This *is* jank
    G.E_MANAGER:add_event(Event({
        func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.current_round.aij_the_journey_blind = {selected_suit = selected_suit or "Spades", triggered = false}
                    return true
                end
            }))
            return true
        end
    }))
end
function reset_aureate_coin_blind()
    G.GAME.current_round.aij_aureate_coin_blind = {spent_money = 0}
end
function reset_the_heart_blind()
    local hands = {
        "Two Pair",
        "Flush",
        "Straight",
        "Three of a Kind"
    }
    local chosen_hand = pseudorandom_element(hands, pseudoseed('jest_the_heart_blind'..G.GAME.round_resets.ante))
    G.GAME.current_round.aij_the_heart = {hand = chosen_hand or "Two Pair"}
end

function All_in_Jest.reset_game_globals(run_start)
    -- Globals for a single blind (like Idol)
    reset_jest_magick_joker_card()
    reset_jest_you_broke_it_card()
	  G.GAME.shop_galloping_dominoed = false
    G.GAME.jest_shop_perma_free = false

    if G.GAME.round_resets.blind_states.Boss == 'Defeated' or run_start then
       -- Globals for a single ante (not a thing in Vanilla)
       -- Checks run_start as well to trigger at start of run, G.GAME.round_resets.blind_states.Boss == 'Defeated' only checks for the end of an ante

        -- Reset Boss Blinds
       reset_the_auroch_blind()
       reset_the_journey_blind()
       reset_aureate_coin_blind()
       reset_the_heart_blind()
    end

    if run_start then
        -- Globals for a whole run (like Fortune Teller)
        reset_handsome_joker_card()

        G.GAME.all_in_jest.starting_prams.deck_size = #G.deck.cards
        
        local index = {4,5}
        G.all_in_jest.pit_blind_ante = pseudorandom_element(index, pseudoseed('pit_blinds'))
    end
end

-- Function to allow for filtering joker-copy effects and applying blacklists to copiable jokers
-- Used by: Visage, Clay Joker, Joker.png, and Czar
--  from_collection - set true for jokers that copy a joker from collection, rather than a joker that was previously in-play
function All_in_Jest.expanded_copier_compat(center, from_collection)
    if not (center and type(center) == "table") then
        return
    end
    local blacklist = {
        'j_blueprint',
        'j_aij_lexicon' -- Crashes the game for some reason, temporary fix
    }
    if from_collection then
        table.insert(blacklist, 'j_campfire')

        -- can remove these if they are made un-perishable
        table.insert(blacklist, 'j_aij_egg_cc')
        table.insert(blacklist, 'j_aij_toothy_joker')
        table.insert(blacklist, 'j_aij_coulrorachne')
    end

    if center.blueprint_compat and 
        (not from_collection or (center.discovered and 
        center.perishable_compat and 
        center.rarity ~= 4 and 
        not G.GAME.banned_keys[center.key]))
    then
        for _, v in ipairs(blacklist) do
            if center.key == v then
                return false
            end
        end

        -- if from_collection then
        --     if center.in_pool and type(center.in_pool) == 'function' then
        --         return center:in_pool()
        --     end

        --     if center.yes_pool_flag and not G.GAME.pool_flags[center.yes_pool_flag] then
        --         return false
        --     end
        --     if center.no_pool_flag and G.GAME.pool_flags[center.no_pool_flag] then
        --         return false
        --     end

        --     if center.enhancement_gate then
        --         for _, v in pairs(G.playing_cards) do
        --             if SMODS.has_enhancement(v, center.enhancement_gate) then
        --                 return true
        --             end
        --         end
        --     end
        -- end

        return true
    else
        return false
    end
end

-- Used for Elder
function All_in_Jest.get_longest_held_joker()
    local longest_joker = nil
    local min_index = math.huge
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            local is_elder = (v.config.center.key == "j_aij_elder")
            if not is_elder and v.ability.jest_held_order then
                if tonumber(v.ability.jest_held_order) < min_index then
                    min_index = tonumber(v.ability.jest_held_order)
                    longest_joker = v
                end
            end
        end
    end
    return longest_joker
end

-- Check if Pit Blinds should appear or not
function All_in_Jest.pit_blinds_in_play()
    local blue_stake_replacement_blind = G.GAME.stake >= 5 and All_in_Jest.config.blue_stake_rework and G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante
    local all_pit_blinds_challenge = G.GAME.modifiers["aij_all_pit_blinds"] and G.GAME.round_resets.ante >= 2
    return blue_stake_replacement_blind or all_pit_blinds_challenge or G.GAME.won
end

-- Check if Pit Blinds should be guarenteed to show up
function All_in_Jest.force_pit_blind()
    local blue_stake_replacement_blind = G.GAME.stake >= 5 and All_in_Jest.config.blue_stake_rework and G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante
    local all_pit_blinds_challenge = G.GAME.modifiers["aij_all_pit_blinds"] and G.GAME.round_resets.ante >= 2
    local not_showdown_blind = not ((G.GAME.round_resets.ante)%G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2)
    return (blue_stake_replacement_blind or all_pit_blinds_challenge) and not_showdown_blind
end

function All_in_Jest.get_current_blind_mult()
    if G.GAME.blind.in_blind then
        local original_chips = G.GAME.blind.aij_original_chips > to_big(0) and G.GAME.blind.aij_original_chips or G.GAME.blind.chips
        return (G.GAME.blind.chips - G.GAME.blind.aij_added_chips) / (original_chips / G.GAME.blind.aij_original_mult)
    else
        return G.GAME.blind.mult
    end
end

-- Increases blind requirement while making the score tick up with an animation
-- mod_mult increases the mult of the blind (so mod_mult = 1 makes a blind go from x2 to x3)
-- mod_add increases the blind requirement directly. This occurs after mod_add
-- "Ticking up" animate code copied + modified from Bunco
function All_in_Jest.ease_blind_requirement(mod_mult, mod_add, skip_animation)
    if not G.GAME.blind.in_blind then return end

    local original_chips = G.GAME.blind.aij_original_chips > to_big(0) and G.GAME.blind.aij_original_chips or G.GAME.blind.chips
    if mod_mult == nil then
        mod_mult = 0
    end
    if mod_add == nil then
        mod_add = 0
    end

    local original_mult = G.GAME.blind.aij_original_mult
    local previously_added = G.GAME.blind.aij_added_chips -- Only accounts chips added via mod_add
    local current_mult = All_in_Jest.get_current_blind_mult() -- Takes into account previous ease_blind_requirement calls
    local desired_chip_amount = (original_chips / original_mult) * (current_mult + mod_mult) + mod_add + previously_added

    local chip_mod -- Calculate how much the chips count changes each "tick", set to iterate over ~120 ticks
    if type(G.GAME.blind.chips) ~= 'table' then
        chip_mod = math.ceil(math.abs(desired_chip_amount - G.GAME.blind.chips) / 120)
    else
        chip_mod = ((desired_chip_amount - G.GAME.blind.chips):abs() / 120):ceil()
    end
    local step = 0

    local chips_text_integer = G.GAME.blind.chips -- Used to track animation
    if skip_animation then
        chips_text_integer = desired_chip_amount
        G.GAME.blind.chip_text = number_format(chips_text_integer)
    else
        if chips_text_integer < to_big(desired_chip_amount) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blocking = true,
                func = function()
                    chips_text_integer = chips_text_integer + G.SETTINGS.GAMESPEED * chip_mod
                    if chips_text_integer < desired_chip_amount then
                        G.GAME.blind.chip_text = number_format(chips_text_integer)
                        if step % 5 == 0 then
                            play_sound('chips1', 0.8 + (step * 0.005))
                        end
                        step = step + 1
                    else
                        chips_text_integer = desired_chip_amount
                        G.GAME.blind.chip_text = number_format(chips_text_integer)
                        G.GAME.blind:wiggle()
                        return true
                    end
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blocking = true,
                func = function()
                    chips_text_integer = chips_text_integer - G.SETTINGS.GAMESPEED * chip_mod
                    if chips_text_integer > desired_chip_amount then
                        G.GAME.blind.chip_text = number_format(chips_text_integer)
                        if step % 5 == 0 then
                            play_sound('chips1', 0.8 + (step * 0.005))
                        end
                        step = step - 1
                    else
                        chips_text_integer = desired_chip_amount
                        G.GAME.blind.chip_text = number_format(chips_text_integer)
                        G.GAME.blind:wiggle()
                        return true
                    end
                end
            }))
        end
    end

    G.GAME.blind.chips = desired_chip_amount -- Immediately set in case this function is called successively
    G.GAME.blind.aij_added_chips = G.GAME.blind.aij_added_chips + mod_add
end

-- Redisplays the blind info on the blind select screen
-- Used to update dynamic score requirements
function All_in_Jest.aij_refresh_boss_blind()
    if G.GAME.blind.boss then return end

    if G.blind_select_opts then
        local par = G.blind_select_opts.boss.parent
        if par and par.config.object then
            G.blind_select_opts.boss:remove()
            G.blind_select_opts.boss = UIBox{
                T = {par.T.x, 0, 0, 0},
                definition = { n = G.UIT.ROOT, config = { align = "cm", colour = G.C.CLEAR }, nodes = {
                  UIBox_dyn_container({ create_UIBox_blind_choice('Boss') }, false, get_blind_main_colour('Boss'), mix_colours(G.C.BLACK, get_blind_main_colour('Boss'), 0.8))
                } },
                config = {
                    align = "bmi",
                    offset = {
                        x = 0,
                        y = G.blind_select_opts.boss.alignment.offset.y
                    },
                    major = par,
                    xy_bond = 'Weak'
                }
            }
            par.config.object = G.blind_select_opts.boss
            par.config.object:recalculate()
            G.blind_select_opts.boss.parent = par
            -- G.blind_select_opts.boss.alignment.offset.y = -0.2
        end
    end

    if G.SHOP_SIGN and next(SMODS.find_mod("unBlindShopGUI")) then
        G.SHOP_SIGN:remove()
        G.SHOP_SIGN = UIBox{
          definition = 
            {n=G.UIT.ROOT, config = {colour = G.C.CLEAR, align = 'bm' }, nodes={
              G.UIDEF.UnBlind_current_blinds()
            }},
          config = {
            align="cm",
            offset = {x=0,y=0},
            major = G.HUD:get_UIE_by_ID('row_blind'),
            bond = 'Weak'
          }
        }
    end
end

function All_in_Jest.get_random_joker_colours(colour)
    local clothes_and_makeup_colours = {
        HEX('fd5f55'), HEX('fda200'), HEX('009cfd'), HEX('55a383'), HEX('8dffd0'), HEX('7dc6f3'),
        HEX('597a90'), HEX('83c4b4'), HEX('608d81'), HEX('d9dd61'), HEX('f66178'), HEX('e39571'),
        HEX('ff7e5f'), HEX('71d0e4'), HEX('fde487'), HEX('eeeeee'), HEX('4f6367'), HEX('d5495e'),
    }
    if colour == 'skintone' then
        local seed = pseudoseed('randomjoker')
        local raritys_weight = {['common'] = 0.7, ['uncommon'] = 0.2, ['rare'] = 0.07, ['very_rare'] = 0.03}
        local total_rate = 0
        for k, v in pairs(raritys_weight) do
            total_rate = total_rate + v
        end
        local append = G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante or 1
        local polled_rate = pseudorandom(pseudoseed('skintone'..append))*total_rate
        local check_rate = 0
    
        local rates = {}
        for k, v in pairs(raritys_weight) do
            rates[#rates+1] = {rarity = k, val = v}
        end
        local rarity = "common"
        for _, v in ipairs(rates) do
            if polled_rate > check_rate and polled_rate <= check_rate + v.val then
                rarity = v.rarity
                break
            end
            check_rate = check_rate + v.val
        end
        local colour_palettes = {
            ['common'] = {
                jimbo = {HEX('ffffff'), HEX('dcdcdc'), HEX('c0c0c0')},
            }, 
            ['uncommon'] = {
                greedy_joker = {HEX('fde9d6'), HEX('f8cbaa'), HEX('f28a3c')},
                lusty_joker = {HEX('fde8e8'), HEX('fdd3d5'), HEX('ff6368')},
                wrathful_joker = {HEX('f9f7ff'), HEX('dddafb'), HEX('7a73bb')},
                gluttonous_joker = {HEX('e8ffff'), HEX('cdf8f5'), HEX('449d95')},
                steel = {HEX('f4f7fc'), HEX('e5edf9'), HEX('c2cddf')},
            },
            ['rare'] = {
                marble = {HEX('f9f3e6'), HEX('e8dfc4'), HEX('cbcdb2')},
                tarot = {HEX('cbcdb2'), HEX('d9b672'), HEX('bb9d64')},
                astronomer = {HEX('dff5fc'), HEX('84c5d2'), HEX('5b9baa')},
            },
            ['very_rare'] = {
                gold = {HEX('fdd897'), HEX('f1ba5b'), HEX('dfab55')},
                blueprint = {HEX('abbdf8'), HEX('829cf4'), HEX('6484f7')},
            }
        }
        local selected_palette = pseudorandom_element(colour_palettes[rarity], pseudoseed('randomjoker'))
        return selected_palette
    elseif colour == 'clothes_and_makeup' then
        local clothes_colour = {}
        local makeup_colour = {}
        for i = 1, 5 do
            local ran_element = pseudorandom_element(clothes_and_makeup_colours, pseudoseed('randomjoker'..i))
            for k, v in pairs(clothes_and_makeup_colours) do
                if v == ran_element then
                    v = nil
                end
            end
            clothes_colour[#clothes_colour+1] = ran_element
        end
        for i = 6, 9 do
            local ran_element = pseudorandom_element(clothes_and_makeup_colours, pseudoseed('randomjoker'..i))
            for k, v in pairs(clothes_and_makeup_colours) do
                if v == ran_element then
                    v = nil
                end
            end
            makeup_colour[#makeup_colour+1] = ran_element
        end
        local makeup1 = pseudoseed('randomjokert1')
        local makeup2 = pseudoseed('randomjokert2')
        if makeup1 <= 0.5 then
            clothes_colour[1] = makeup_colour[1]
        end
        if makeup2 <= 0.5 then
            clothes_colour[2] = makeup_colour[2]
        end
        return clothes_colour, makeup_colour
    elseif colour == 'hair' then
        local seed = pseudoseed('randomjoker')
        local raritys_weight = {['common'] = 0.7, ['uncommon'] = 0.2, ['rare'] = 0.07, ['very_rare'] = 0.03}
        local total_rate = 0
        for k, v in pairs(raritys_weight) do
            total_rate = total_rate + v
        end
        local append = G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante or 1
        local polled_rate = pseudorandom(pseudoseed('skintone'..append))*total_rate
        local check_rate = 0
    
        local rates = {}
        for k, v in pairs(raritys_weight) do
            rates[#rates+1] = {rarity = k, val = v}
        end
        local rarity = "common"
        for _, v in ipairs(rates) do
            if polled_rate > check_rate and polled_rate <= check_rate + v.val then
                rarity = v.rarity
                break
            end
            check_rate = check_rate + v.val
        end
        local colour_palettes = {
            ['common'] = {
                red = {HEX('fd5f55'), HEX('f49b78'), HEX('dd463c')},
            }, 
            ['uncommon'] = {
                orange = {HEX('fda200'), HEX('ffce76'), HEX('b3760a')},
                black = {HEX('6d7c7f'), HEX('869294'), HEX('4f6367')},
                pale_red = {HEX('dd9793'), HEX('f1bfbc'), HEX('a47875')},
            },
            ['rare'] = {
                blonde = {HEX('f1d562'), HEX('f9eec1'), HEX('e1b649')},
                white = {HEX('dcdcdc'), HEX('ffffff'), HEX('959595')},
            },
            ['very_rare'] = clothes_and_makeup_colours
        }
        local selected_colour = pseudorandom_element(colour_palettes[rarity], pseudoseed('randomjoker'))
        return selected_colour
    end
end

function All_in_Jest.get_inherent_effects(card, type, amt_only)
    if card.aij_inherent_effects and card.aij_inherent_effects[type..'s'] and #card.aij_inherent_effects[type..'s'] > 0 then
        local effects = {}
        local amt = 0
        for k, v in pairs(card.aij_inherent_effects[type..'s']) do
            effects[#effects + 1] = v
            amt = amt + 1
        end
        return amt_only and amt or effects
    else
        return amt_only and 0 or {}
    end
end

function All_in_Jest.apply_inherent_effect(card, effect, type)
    card.aij_inherent_effects = card.aij_inherent_effects or {}
    if not effect then return end
    if type == 'edition' or type == 'enhancement' then
        card.aij_inherent_effects[type..'s'] = card.aij_inherent_effects[type..'s'] or {}
        card.aij_inherent_effects[type..'s'][#card.aij_inherent_effects[type..'s'] + 1] = copy_table(effect)
    end
end

function Card:All_in_Jest_set_seal_edition(edition, immediate, silent, delay)
	SMODS.enh_cache:write(self, nil)
	
	if self.aij_seal_edition then
		self.ability.card_limit = self.ability.card_limit - (self.aij_seal_edition.card_limit or 0)
		self.ability.extra_slots_used = self.ability.extra_slots_used - (self.aij_seal_edition.extra_slots_used or 0)
	end

	local old_edition = self.aij_seal_edition
	if old_edition and old_edition.key then
		self.ignore_base_shader[old_edition.key] = nil
		self.ignore_shadow[old_edition.key] = nil

		local on_old_edition_removed = G.P_CENTERS[old_edition.key] and G.P_CENTERS[old_edition.key].on_remove
		if type(on_old_edition_removed) == "function" then
			on_old_edition_removed(self)
		end
	end

	local edition_type = nil
	if type(edition) == 'string' then
		assert(string.sub(edition, 1, 2) == 'e_', ("Edition \"%s\" is missing \"e_\" prefix."):format(edition))
		edition_type = string.sub(edition, 3)
	elseif type(edition) == 'table' then
		if edition.type then
			edition_type = edition.type
		else
			for k, v in pairs(edition) do
				if v then
					assert(not edition_type, "Tried to apply more than one edition.")
					edition_type = k
				end
			end
		end
	end

	if not edition_type or edition_type == 'base' then
		if self.aij_seal_edition == nil then -- early exit
			return
		end
		self.aij_seal_edition = nil -- remove edition from card
		self:set_cost()
		if not silent then
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = not immediate and 0.2 or 0,
				blockable = not immediate,
				func = function()
					self:juice_up(1, 0.5)
					play_sound('whoosh2', 1.2, 0.6)
					return true
				end
			}))
		end
		if delay then
			self.aij_delay_seal_edition = old_edition
			G.E_MANAGER:add_event(Event({
				trigger = 'immediate',
				func = function()
					self.aij_delay_seal_edition = nil
					return true
				end
			}))
		end
		return
	end

	self.aij_seal_edition = {}
	self.aij_seal_edition[edition_type] = true
	self.aij_seal_edition.type = edition_type
	self.aij_seal_edition.key = 'e_' .. edition_type

	local p_edition = G.P_CENTERS['e_' .. edition_type]

	if p_edition.override_base_shader or p_edition.disable_base_shader then
		self.ignore_base_shader[self.aij_seal_edition.key] = true
	end
	if p_edition.no_shadow or p_edition.disable_shadow then
		self.ignore_shadow[self.aij_seal_edition.key] = true
	end

    if p_edition.aij_seal_config then
        for k, v in pairs(p_edition.aij_seal_config) do
		    if type(v) == 'table' then
			    self.aij_seal_edition[k] = copy_table(v)
		    else
			    self.aij_seal_edition[k] = v
		    end
	    end
        for k, v in pairs(p_edition.config) do
		    if type(v) == 'table' and not self.aij_seal_edition[k] then
			    self.aij_seal_edition[k] = copy_table(v)
		    elseif not self.aij_seal_edition[k] then
			    self.aij_seal_edition[k] = v
		    end
	    end
    else
	    for k, v in pairs(p_edition.config) do
		    if type(v) == 'table' then
			    self.aij_seal_edition[k] = copy_table(v)
		    else
			    self.aij_seal_edition[k] = v
		    end
	    end
        if edition_type == 'polychrome' then
            self.aij_seal_edition['x_mult'] = self.aij_seal_edition['x_mult'] - 1
        end
        jest_ability_calculate(self, "/", 2, nil, nil, false, nil, "aij_seal_edition")
        if edition_type == 'polychrome' then
            self.aij_seal_edition['x_mult'] = self.aij_seal_edition['x_mult'] + 1
        end
    end

	local on_edition_applied = p_edition.on_apply
	if type(on_edition_applied) == "function" then
		on_edition_applied(self)
	end

	if self.area and self.area == G.jokers then
		if self.aij_seal_edition then
			if not G.P_CENTERS['e_' .. (self.aij_seal_edition.type)].discovered then
				discover_card(G.P_CENTERS['e_' .. (self.aij_seal_edition.type)])
			end
		else
			if not G.P_CENTERS['e_base'].discovered then
				discover_card(G.P_CENTERS['e_base'])
			end
		end
	end

	if self.aij_seal_edition and not silent then
		local ed = G.P_CENTERS['e_' .. (self.aij_seal_edition.type)]
		G.CONTROLLER.locks.aij_seal_edition = true
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = not immediate and 0.2 or 0,
			blockable = not immediate,
			func = function()
				if self.aij_seal_edition then
					self:juice_up(1, 0.5)
					play_sound(ed.sound.sound, ed.sound.per, ed.sound.vol)
				end
				return true
			end
		}))
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.1,
			func = function()
				G.CONTROLLER.locks.aij_seal_edition = false
				return true
			end
		}))
	end

	if delay then
		self.aij_delay_seal_edition = old_edition or {base = true}
		G.E_MANAGER:add_event(Event({
			trigger = 'immediate',
			func = function()
				self.aij_delay_seal_edition = nil
				return true
			end
		}))
	end

	self.ability.card_limit = self.ability.card_limit + (self.aij_seal_edition.card_limit or 0)
	self.ability.extra_slots_used = self.ability.extra_slots_used + (self.aij_seal_edition.extra_slots_used or 0)


	if G.jokers and self.area == G.jokers then
		check_for_unlock({ type = 'modify_jokers' })
	end

	self:set_cost()
end

function All_in_Jest_format_destroy(center_text)

    if center_text == {} then
        return center_text
    end

    local function add_red_text(text, start_index, end_index, base_format)
        local destroyed_format = base_format
        if base_format == "{}" then
            destroyed_format = "{C:red}"
        elseif string.match(base_format, "C:%w+") then -- Try to find an existing colour option
            destroyed_format, _ = string.gsub(base_format, "C:%w+", "C:red")
        else
            destroyed_format = string.sub(base_format, 1, -2) .. ",C:red}"
        end
        return string.sub(text, 1, start_index - 1)..destroyed_format..string.sub(text, start_index, end_index)..base_format..string.sub(text, end_index + 1)
    end

    local destroy_texts = {
        "destroying",
        "destroyed",
        "destroys",
        "destroy"
    }
    local found_strings = {}
    local one_box = true

    if type(center_text[1]) == "table" then
        -- Description has multiple boxes (e.g. "You got Mail" joker in this mod)
        one_box = false
        for j, box in ipairs(center_text) do
            found_strings[j] = {}
            for i, line in ipairs(box) do
                found_strings[j][i] = {}
                for _, text in ipairs(destroy_texts) do
                    local start_index, end_index = string.find(string.lower(line), text)
                    if start_index then
                        local already_processed = false
                        for _, t in ipairs(found_strings[j][i]) do
                            if start_index == t.start_index then
                                already_processed = true
                                break
                            end
                        end

                        if not already_processed then
                            -- Try to extract any existing formatting on the destroy text
                            -- Lua cannot perform string.match or string.find on last occurence, so use string.reverse to emulate this
                            local applied_formatting = string.reverse(string.match(string.reverse(string.sub(line, 1, start_index - 1)), "}.-{") or "}{")
                            -- Do not apply red text if text is already red
                            if not string.match(applied_formatting, "C:red") then
                                local t = {
                                    start_index = start_index,
                                    end_index = end_index,
                                    format = applied_formatting
                                }
                                table.insert(found_strings[j][i], t)
                            end
                        end
                    end
                end
            end
        end
    elseif type(center_text[1]) == "string" then
        -- Description does not have multiple boxes
        found_strings[1] = {}
        for i, line in ipairs(center_text) do
            found_strings[1][i] = {}
            for _, text in ipairs(destroy_texts) do
                local start_index, end_index = string.find(string.lower(line), text)
                if start_index then
                    local already_processed = false
                    for _, t in ipairs(found_strings[1][i]) do
                        if start_index == t.start_index then
                            already_processed = true
                            break
                        end
                    end

                    if not already_processed then
                        -- Try to extract any existing formatting on the destroy text
                        -- Lua cannot perform string.match or string.find on last occurence, so use string.reverse to emulate this
                        local applied_formatting = string.reverse(string.match(string.reverse(string.sub(line, 1, start_index - 1)), "}.-{") or "}{")
                        -- Do not apply red text if text is already red
                        if not string.match(applied_formatting, "C:red") then
                            local t = {
                                start_index = start_index,
                                end_index = end_index,
                                format = applied_formatting
                            }
                            table.insert(found_strings[1][i], t)
                        end
                    end
                end
            end
        end
    end

    for box_index, _ in ipairs(found_strings) do
        for line_index, _ in ipairs(found_strings[box_index]) do
            for _, t in ipairs(found_strings[box_index][line_index]) do
                local start_index = t.start_index
                local end_index = t.end_index
                local base_format = t.format
                if one_box then
                    center_text[line_index] = add_red_text(center_text[line_index], start_index, end_index, base_format)
                else
                    center_text[box_index][line_index] = add_red_text(center_text[box_index][line_index], start_index, end_index, base_format)
                end
            end
        end
    end

    return center_text
end

G.FUNCS.aij_hover_tag_branching = function(e)
    if not e.parent or not e.parent.states then return end
    if e.states.hover.is and (e.created_on_pause == G.SETTINGS.paused) and not e.alert then
        -- sendDebugMessage(tprint(e), "AIJ")
        local _sprite = e.config.ref_table[2]:get_uibox_table()
        e.alert = UIBox{
            definition = G.UIDEF.card_h_popup(_sprite),
            config = {align="tm", offset = {x = 0, y = -0.1},
            major = e,
            instance_type = 'POPUP'},
        }
        _sprite:juice_up(0.05, 0.02)
        play_sound('paper1', math.random()*0.1 + 0.55, 0.42)
        play_sound('tarot2', math.random()*0.1 + 0.55, 0.09)
        e.alert.states.collide.can = false
    elseif e.alert and (not e.states.hover.is or e.created_on_pause ~= G.SETTINGS.paused) then
        e.alert:remove()
        e.alert = nil
    end
end

-- Function that defines when the tag area in the shop should appear (or not)
All_in_Jest.show_shop_aij_tags = function(e)
    return next(SMODS.find_card("j_aij_ijoker_co")) or next(SMODS.find_card("j_aij_death_of_a_salesman"))
end