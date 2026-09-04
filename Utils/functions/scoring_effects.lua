
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
-- Adds additional scoring effects
-- Balance% and setting chips/mult to an exact value (e.g. Topsy the Clown)
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

table.insert(SMODS.calculation_keys, "aij_balance_percent")
if SMODS.other_calculation_keys then
    table.insert(SMODS.other_calculation_keys, "aij_balance_percent")
end
table.insert(SMODS.calculation_keys, "aij_set_mult")
if SMODS.scoring_parameter_keys then
    table.insert(SMODS.scoring_parameter_keys, "aij_set_mult")
    table.insert(SMODS.Scoring_Parameters['mult'], "aij_set_mult")
end
table.insert(SMODS.calculation_keys, "aij_set_chips")
if SMODS.scoring_parameter_keys then
    table.insert(SMODS.scoring_parameter_keys, "aij_set_chips")
    table.insert(SMODS.Scoring_Parameters['chips'], "aij_set_chips")
end

-- Simulated card effect
table.insert(SMODS.calculation_keys, "aij_return_to_hand")
table.insert(SMODS.other_calculation_keys, "aij_return_to_hand")
table.insert(SMODS.silent_calculation, "aij_return_to_hand")

local function calculate_balance_percent_values(input_hand_chips, input_mult, percent)
  local chip_mod = percent * input_hand_chips
  local mult_mod = percent * input_mult
  local avg = (chip_mod + mult_mod)/2
  local new_hand_chips = input_hand_chips + (avg - chip_mod)
  local new_mult = input_mult + (avg - mult_mod)

  return new_hand_chips, new_mult
end

-- table.insert(SMODS.calculation_keys, 1, "aij_balance_percent") -- This version would put the effect at the start, making it go before chip/mult/etc. effects.
local aij_balance_mixed = false
local aij_original_smods_calculate_individal_effect_ref = SMODS.calculate_individual_effect
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
    if key == 'aij_set_mult' then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        SMODS.Scoring_Parameters.mult:modify(amount - mult)
        if not effect.remove_default_message then
            if effect.aij_set_mult_message then
                card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.aij_set_mult_message)
            else
                card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'jokers', nil, percent, nil, {message = localize{type='variable',key='a_aij_mult_equal',vars={amount}}})
            end
        end
        return true
    end
    if key == 'aij_set_chips' then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        SMODS.Scoring_Parameters.chips:modify(amount - hand_chips)
        if not effect.remove_default_message then
            if effect.aij_set_mult_message then
                card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.aij_set_mult_message)
            else
                card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'jokers', nil, percent, nil, {message = localize{type='variable',key='a_aij_chips_equal',vars={amount}}})
            end
        end
        return true
    end
    if key == "aij_return_to_hand" then
        return key
    end

    return aij_original_smods_calculate_individal_effect_ref(effect, scored_card, key, amount, from_edition)
end
