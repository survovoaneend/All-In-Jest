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
            elseif main[i].config and main[i].config.object and main[i].config.object.config and type(main[i].config.object.config) == "table" then
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

function level_up_other_hand(card, hand, other_hand, instant, amount, type)
    local level = 1
    
    if not type or type == 'mult' then
        G.GAME.hands[hand].mult = math.max(1, G.GAME.hands[hand].mult + amount)
    end
    if not type or type == 'chips' then
        G.GAME.hands[hand].chips = math.max(0, G.GAME.hands[hand].chips + amount)
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function() check_for_unlock{type = 'upgrade_hand', hand = hand, level = G.GAME.hands[hand].level} return true end)
    }))
end

function level_up_hand_chips(card, hand, instant, amount)
    if (G.GAME.hands[hand].level and G.GAME.hands[hand].chips) then
        amount = amount or 1
        local extra_chips = 0
        G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + amount)
        local val = G.GAME.hands[hand].l_chips * amount * 2
        local extra_amount = (val * (next(SMODS.find_card("j_aij_lost_carcosa")) and G.GAME.all_in_jest.apply.lost_carcosa_mult or 1)) - val
        extra_amount = (extra_amount * (next(SMODS.find_card("j_aij_lost_carcosa")) and 1 or 0)) + (extra_chips > 0 and extra_chips or 0)
        if hand == 'Straight Flush' then
            level_up_other_hand(nil, 'aij_Royal Flush', hand, true, amount * 2 + extra_amount, 'chips')
        end
        G.GAME.hands[hand].chips = math.max(0, G.GAME.hands[hand].chips + math.floor((G.GAME.hands[hand].l_chips * amount * 2 + extra_amount)))
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
        local extra_mult = 0
        G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + amount)
        local val = G.GAME.hands[hand].l_mult * amount * 2
        local extra_amount = (val * (next(SMODS.find_card("j_aij_lost_carcosa")) and G.GAME.all_in_jest.apply.lost_carcosa_mult or 1)) - val
        extra_amount = (extra_amount * (next(SMODS.find_card("j_aij_lost_carcosa")) and 1 or 0)) + (extra_mult > 0 and extra_mult or 0)
        if hand == 'Straight Flush' then
            level_up_other_hand(nil, 'aij_Royal Flush', hand, true, amount * 2 + extra_amount, 'mult')
        end
        G.GAME.hands[hand].mult = math.max(1, G.GAME.hands[hand].mult + math.floor((G.GAME.hands[hand].l_mult * amount * 2 + extra_amount)))
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

  -- Store original values before modification
  local keys, original_values = jest_ability_get_items(card, "nil", 0, exclusions, inclusions, do_round, only, extra_search)

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

  local function process_value(val, base_val)
    if type(val) == "number" then
      local delta = val - base_val
      local result = operators[equation](base_val, extra_value) + delta
      if do_round then
        if base_val % 1 ~= 0 then
          return round_hundredth(result)
        else
          return round_int(result)
        end
      else
        return result
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

  local function process_table(t, base_table)
    for key, value in pairs(t) do
      if value ~= nil and should_process(key, value) then
        if type(value) == "number" then
          t[key] = process_value(value, base_table[key] or 0)
        elseif type(value) == "table" and type(base_table[key]) == "table" then
          process_table(value, base_table[key])
        end
      end
    end
  end

  function nested_tables(temcard, index)
      local current = temcard
      for key in string.gmatch(index, "[^%.]+") do
          if type(current) ~= "table" then
              return current
          end
          current = current[key]
      end
      return current
  end

  local search_table = extra_search and nested_tables(card, extra_search) or card.ability

  if search_table then
    local _, base_values = jest_ability_get_items(card, "nil", 0, exclusions, inclusions, do_round, only, extra_search)
    if type(search_table) == "number" then
      search_table = process_value(search_table, base_values[1] or 0)
    elseif type(search_table) == "table" then
      local base_map = {}
      for i, k in ipairs(keys) do base_map[k] = original_values[i] end
      process_table(search_table, base_map)
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

  function nested_tables(temcard, index)
      local current = temcard
      for key in string.gmatch(index, "[^%.]+") do
          if type(current) ~= "table" then
              return current
          end
          current = current[key]
      end
      return current
  end

  local search_table = extra_search and nested_tables(card, extra_search) or card.ability

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
    id = 'wuppo',
    name = 'Wuppo',
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
    id = 'king_in_yellow',
    name = 'The King in Yellow',
    suits = {
      'Diamonds',
      'Clubs',
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
    id = 'talos_principle',
    name = 'Talos Principle',
    suits = {
      'Spades',
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
    id = 'alan_wake',
    name = 'Alan Wake',
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
    id = 'petscop',
    name = 'Petscop',
    suits = {
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
        jest_ybi_enhancement = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
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
    if enhancement ~= 'm_stone' and enhancement ~= 'm_aij_canvas' then
      valid_enhancements[#valid_enhancements + 1] = enhancement
    end
  end
  local valid_jest_handsome_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if v.ability.effect ~= 'Stone Card' and v.ability.effect ~= 'Canvas Card'then
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
        jest_handsome_card_enhancement = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
      end
      G.GAME.current_round.jest_handsome_joker_card.enhancement = jest_handsome_card_enhancement
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
      G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() 
	    card.ability.patches = card.ability.patches or {}
        card.ability.patches[suit] = true
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
      return true end }))
  else
    card.ability.patches = card.ability.patches or {}
    card.ability.patches[suit] = true
  end
  check_for_unlock({type = 'add_patch'})
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
    local card = Card(G.shop_booster.T.x + G.shop_booster.T.w/2,
    G.shop_booster.T.y, G.CARD_W*0.7, G.CARD_W*0.7, G.P_CARDS.empty,
    G.P_CENTERS.c_base,
    {bypass_discovery_center = true, bypass_discovery_ui = true})

    create_shop_card_ui(card, 'Tag', G.shop_booster)
    card.ability.booster_pos = #G.shop_booster.cards + 1
    card.tag_as_card_aij = Tag(key)
    card:set_ability(G.P_CENTERS['aij_tag_as_card'])

    card:start_materialize()
    card.edition = nil
    card.base_cost = price or 1
    card:set_cost()
    G.shop_booster:emplace(card)
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

function All_in_Jest.reroll_joker(card, key, append, temp_key, _card)
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
    local victim_index
    for i, jkr in ipairs(G.jokers.cards) do
        if jkr == victim_joker then
            victim_index = i
            break
        end
    end

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
            if victim_joker and not victim_joker.removed then
                victim_joker:All_in_Jest_start_dissolve({ G.C.SPECTRAL, G.C.WHITE })
                victim_joker:remove_from_deck(true)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if victim_joker and victim_joker.area then victim_joker.area:remove_card(victim_joker) end
                        return true
                    end
                }))
            end

            local new_joker = create_card('Joker', G.jokers, is_legendary, victim_rarity, true, nil,
                replacement_key, 'apex_swap')
            if _card then
                new_joker:set_ability(_card.config.center)
                new_joker.ability.type = _card.ability.type
                new_joker:set_base(_card.config.card)
                for k, v in pairs(_card.ability) do
                    if type(v) == 'table' then 
                        new_joker.ability[k] = copy_table(v)
                    else
                        new_joker.ability[k] = v
                    end
                end
                for k, v in pairs(G.shared_stickers) do
                    if new_joker.ability[k] and not card.ability[k] then
                        new_joker.ability[k] = nil
                    end
                end
            end
            if new_joker then
                new_joker:add_to_deck()
                if victim_index and victim_index <= #G.jokers.cards + 1 then
                    G.jokers:emplace(new_joker, victim_index)
                else
                    G.jokers:emplace(new_joker)
                end
                for k, v in pairs(G.shared_stickers) do
                    if victim_joker.ability[k] then
                        new_joker.ability[k] = true
                        if k == "perishable" and new_joker.ability.perish_tally == nil then
							new_joker.ability.perish_tally = victim_joker.ability.perish_tally or G.GAME.perishable_rounds or 5
						end
                    end
                end
                new_joker:start_materialize({ G.C.SPECTRAL, G.C.WHITE })
                new_joker:set_edition(victim_joker.edition, true, true)
                if victim_joker.ability.all_in_jest and victim_joker.ability.all_in_jest.has_been_rerolled_data then
                    new_joker.ability = victim_joker.ability.all_in_jest.has_been_rerolled_data
                    if new_joker.ability.all_in_jest and new_joker.ability.all_in_jest.has_been_rerolled_data then
                        new_joker.ability.all_in_jest.has_been_rerolled_data = nil
                    end
                end
                if temp_key then
                    new_joker.ability.all_in_jest = new_joker.ability.all_in_jest or {}
                    new_joker.ability.all_in_jest.has_been_rerolled = temp_key
                    new_joker.ability.all_in_jest.has_been_rerolled_data = victim_joker.ability
                end
            end

            card:juice_up(0.5, 0.5)
            return true
        end
    }))
end

function All_in_Jest.set_debuff(card)
	if card.ability and card.ability.all_in_jest and card.ability.all_in_jest.perma_debuff then
		return true
	end
end

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

function All_in_Jest.reset_game_globals(run_start)
    -- Globals for a single blind (like Idol)
    reset_jest_magick_joker_card()
    reset_jest_you_broke_it_card()
	G.GAME.shop_galloping_dominoed = false
    G.GAME.jest_shop_perma_free = false

    if run_start then
    -- Globals for a whole run (like Fortune Teller)
        reset_handsome_joker_card()

        local common_suit, common_rank = nil, nil
        local temp_suit_val, temp_rank_val = 0, 0
        local suit_table, rank_table = {}, {}
        for k, v in pairs(G.deck.cards) do
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
        G.P_BLINDS['bl_aij_the_auroch'].boss.suit = common_suit
        G.P_BLINDS['bl_aij_the_auroch'].boss.rank = common_rank
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