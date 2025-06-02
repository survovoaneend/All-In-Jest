function level_up_hand_chips(card, hand, instant, amount)
    if (G.GAME.hands[hand].level and G.GAME.hands[hand].chips) then
        amount = amount or 1
        G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + amount)

        G.GAME.hands[hand].chips = math.max(0, G.GAME.hands[hand].chips + (G.GAME.hands[hand].l_chips * amount * 2))
        if not instant then 
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                play_sound('tarot1')
                if card then card:juice_up(0.8, 0.5) end
                G.TAROT_INTERRUPT_PULSE = true
                return true end }))
            update_hand_text({delay = 0}, {chips = G.GAME.hands[hand].chips, StatusText = true})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                play_sound('tarot1')
                if card then card:juice_up(0.8, 0.5) end
                G.TAROT_INTERRUPT_PULSE = nil
                return true end }))
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
            delay(1.3)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function() check_for_unlock{type = 'upgrade_hand', hand = hand, level = G.GAME.hands[hand].level} return true end)
        }))
    end
end

function level_up_hand_mult(card, hand, instant, amount)
    if (G.GAME.hands[hand].level and G.GAME.hands[hand].mult) then
        amount = amount or 1
        G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + amount)

        G.GAME.hands[hand].mult = math.max(1, G.GAME.hands[hand].mult + (G.GAME.hands[hand].l_mult * amount * 2))
        if not instant then 
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                play_sound('tarot1')
                if card then card:juice_up(0.8, 0.5) end
                G.TAROT_INTERRUPT_PULSE = true
                return true end }))
            update_hand_text({delay = 0}, {mult = G.GAME.hands[hand].mult, StatusText = true})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                play_sound('tarot1')
                if card then card:juice_up(0.8, 0.5) end
                G.TAROT_INTERRUPT_PULSE = nil
                return true end }))
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
            delay(1.3)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function() check_for_unlock{type = 'upgrade_hand', hand = hand, level = G.GAME.hands[hand].level} return true end)
        }))
    end
end

local ids_op_ref = ids_op
function ids_op(card, op, b, c)
  local id = card:get_id() 
  local other_results = false
  if ids_op_ref ~= nil then
    other_results = ids_op_ref(card, op, b, c) 
  end

  local function alias(x)
    local has_invis, has_doc, has_pygm, has_furb = false, false, false, false

    if G.jokers and G.jokers.cards then
      for _, j in ipairs(G.jokers.cards) do
        local k = j.config and not j.debuff and j.config.center_key
        if k == "j_aij_invisible_man" then has_invis = true end
        if k == "j_aij_doctors_note" then has_doc = true end
        if k == "j_aij_pygmalion" then has_pygm = true end
        if k == "j_aij_furbo_e_stupido" then has_furb = true end
      end
    end

    if has_invis and (({[11]=true, [12]=true, [13]=true, [id]=true})[b] and card:is_face()) then -- Face cards count as 11-13 ranks
      return 11
    end

    if has_doc and card:is_suit("Hearts") and not ({[11]=true, [12]=true, [13]=true, [14]=true})[b] then -- Counts as any heart non-face ranks
      return 11
    end

    if has_pygm and ({[12]=true})[b] and SMODS.has_enhancement(card, 'm_stone') and not card.debuff then -- Stone cards count as rank 12
      return 11
    end

    if has_furb then
        if SMODS.has_enhancement(card, 'm_aij_dyscalcular') and not card.debuff then
            if id == b or not ({[12]=true, [13]=true})[b] then
                return 11
            end
        end
    elseif SMODS.has_enhancement(card, 'm_aij_dyscalcular') and not card.debuff then -- Counts as any non-face ranks and non-ace
        if id == b or not ({[11]=true, [12]=true, [13]=true, [14]=true})[b] then 
            return 11
        end
    end


    if card.ability.jest_all_rank and not card.debuff then -- Counts as any rank
      return 11
    end

    return x
  end

  if other_results == true then
    return true
  end

  if op == "mod" then
    return (id % b) == c
  end

  if op == "==" then
    local lhs = alias(id)
    local rhs = alias(b) 
    return lhs == rhs
  end
  if op == "~=" then
    local lhs = alias(id)
    local rhs = alias(b) 
    return lhs ~= rhs
  end

  if op == ">=" then return id >= b end
  if op == "<=" then return id <= b end
  if op == ">" then return id > b end
  if op == "<" then return id < b end

  error("ids_op: unsupported op " .. tostring(op))
end


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

function balance_percent(card, percent)
  local chip_mod = percent * hand_chips
  local mult_mod = percent * mult
  local avg = (chip_mod + mult_mod)/2
  hand_chips = hand_chips + (avg - chip_mod)
  mult = mult + (avg - mult_mod)
  local text = localize('k_balanced')
  
  update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
  card_eval_status_text(card, 'extra', nil, nil, nil, {
    message = text,
    colour = { 0.8, 0.45, 0.85, 1 },
    sound = 'gong'
 })
  
  G.E_MANAGER:add_event(Event({
    trigger = 'immediate',
    func = (function()
      ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
      ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        blocking = false,
        delay = 4.3,
        func = (function()
          ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
          ease_colour(G.C.UI_MULT, G.C.RED, 2)
          return true
        end)
      }))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        blocking = false,
        no_delete = true,
        delay = 6.3,
        func = (function()
          G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3],
              G.C.BLUE[4]
          G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED
          [4]
          return true
        end)
      }))
      return true
    end)
  }))

  delay(0.6)
  return hand_chips, mult
end

to_big = to_big or function(num)
    return num
end

local set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local t = set_ability_ref(self, center, initial, delay_sprites)
    if self.ability then
        if self.ability.jest_chaotic_card ~= nil and self.ability.jest_chaotic_card and not self.ability.jest_chaotic_card_changing then
            self.ability.jest_chaotic_card = nil
        end
    end
    return t
end

jest_ability_calculate = function(card, equation, extra_value, exclusions, inclusions, do_round, only, extra_search)
  if do_round == nil then do_round = true end
  if only == nil then only = false end

  local operators = {
    ["+"] = function(a, b) return a + b end,
    ["-"] = function(a, b) return a - b end,
    ["*"] = function(a, b) return a * b end,
    ["/"] = function(a, b) return a / b end,
    ["%"] = function(a, b) return a % b end,
    ["="] = function(a, b) return b end,
  }
  
  local function round_int(x)
    return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
  end

  local function round_hundredth(x)
    if x >= 0 then
      return math.floor(x * 100 + 0.5) / 100
    else
      return math.ceil(x * 100 - 0.5) / 100
    end
  end

  local function process_value(val)
    if type(val) == "number" then
      local res = operators[equation](val, extra_value)
      if do_round then
        if val % 1 ~= 0 then
          return round_hundredth(res)
        else
          return round_int(res)
        end
      else
        return res
      end
    else
      return val
    end
  end

  local function should_process(key, value)
    if type(key) ~= "string" then return true end
    if inclusions and next(inclusions) then
      local valid = false
      for _, prefix in ipairs(inclusions) do
        if (not only and key:sub(1, #prefix) == prefix) or (only and key == prefix) then
          valid = true; break
        end
      end
      if not valid then return false end
    end
    if exclusions and exclusions[key] ~= nil then
      if exclusions[key] == true or value == exclusions[key] then
        return false
      end
    end
    return true
  end

  local function process_table(t)
    for key, value in pairs(t) do
      if value ~= nil and should_process(key, value) then
        if type(value) == "number" then
          t[key] = process_value(value)
        elseif type(value) == "table" then
          process_table(value)
        end
      end
    end
  end

  local search_table = extra_search and card[extra_search] or card.ability

  if search_table then
    if type(search_table) == "number" then
      search_table = process_value(search_table)
    elseif type(search_table) == "table" then
      process_table(search_table)
    end
  end
end

jest_ability_get_items = function(card, equation, extra_value, exclusions, inclusions, do_round, only, extra_search)
  if do_round == nil then do_round = true end
  if only == nil then only = false end

  local keys = {}
  local values = {}

  local operators = {
    ["+"] = function(a, b) return a + b end,
    ["-"] = function(a, b) return a - b end,
    ["*"] = function(a, b) return a * b end,
    ["/"] = function(a, b) return a / b end,
    ["%"] = function(a, b) return a % b end,
    ["="] = function(a, b) return b end,
    ["nil"] = function(a, b) return a end,
  }

  local function round_int(x)
    return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
  end
  local function round_hundredth(x)
    if x >= 0 then
      return math.floor(x * 100 + 0.5) / 100
    else
      return math.ceil(x * 100 - 0.5) / 100
    end
  end

  local function process_value(val)
    if type(val) == "number" then
      local res = operators[equation](val, extra_value)
      if do_round then
        if val % 1 ~= 0 then
          return round_hundredth(res)
        else
          return round_int(res)
        end
      else
        return res
      end
    else
      return val
    end
  end

  local function should_process(key, value)
    if type(key) ~= "string" then return true end
    if inclusions and next(inclusions) then
      local valid = false
      for _, prefix in ipairs(inclusions) do
        if (not only and key:sub(1, #prefix) == prefix) or (only and key == prefix) then
          valid = true; break
        end
      end
      if not valid then return false end
    end
    if exclusions and exclusions[key] ~= nil then
      if exclusions[key] == true or value == exclusions[key] then
        return false
      end
    end
    return true
  end

  local search_table = extra_search and card[extra_search] or card.ability

  if search_table then
    if type(search_table) == "number" then
      table.insert(keys, extra_search or "ability")
      table.insert(values, process_value(search_table))
    elseif type(search_table) == "table" then
      for key, value in pairs(search_table) do
        if value ~= nil and should_process(key, value) then
          table.insert(keys, key)
          table.insert(values, process_value(value))
        end
      end
    end
  end

  return keys, values
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
      G.GAME.current_round.jest_you_broke_it_card.enhancement = jest_ybi_enhancement
    end
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

function get_probability(rnd_val, op, num, den)
    --Maninulate numerator/denominatior here
    local threshold = num / den
    local result = false

    if op == "<" then result = rnd_val < threshold
    elseif op == "<=" then result = rnd_val <= threshold
    elseif op == ">" then result = rnd_val > threshold
    elseif op == ">=" then result = rnd_val >= threshold
    elseif op == "==" then result = rnd_val == threshold
    elseif op == "~=" then result = rnd_val ~= threshold
    else error("bad op: "..tostring(op)) end

    if result then
        SMODS.calculate_context({
            probability_trigger = {result = true, numerator = num, denominator = den}
        })
    else
        SMODS.calculate_context({
            probability_trigger = {result = false, numerator = num, denominator = den}
        })
    end

    return result
end

local remove = Card.remove
function Card:remove(...)
    self:remove_prediction_card()
    return remove(self, ...)
end

local _click = Card.click
function Card:click(...)
    if self.area and self.area.config and self.area.config.type == "shop" then
        local has_ultrasound = false
        if G.jokers ~= nil and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                if j.config and j.config.center_key == "j_aij_ultrasound" then
                    has_ultrasound = true
                end
            end
        end
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
function create_consumable(card_type,tag,message,extra, thing1, thing2)
    extra=extra or {}
    
    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = (function()
                local card = create_card(card_type,G.consumeables, nil, nil, thing1, thing2, extra.forced_key or nil, tag)
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
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                if message~=nil then
                    card_eval_status_text(card,'extra',nil,nil,nil,{message=message})
                end
        return true
    end)}))
end

function create_joker(card_type,tag,message,extra, rarity)
    extra=extra or {}
    
    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = (function()
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
    end)}))
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