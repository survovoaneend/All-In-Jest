local square_eyes = {
    object_type = "Joker",
    order = 49,
  
    key = "square_eyes",
    config = {
      extra = {
        mult_per_four = 4
      }
    },
    rarity = 2,
    pos = { x = 20, y = 1 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_per_four
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and context.other_card then
            if context.other_card:get_id() == 4 then
                local fours_in_played_hand = 0
                if context.full_hand then 
                    for _, p_card_in_full_hand in ipairs(context.full_hand) do
                        if p_card_in_full_hand:get_id() == 4 then
                            fours_in_played_hand = fours_in_played_hand + 1
                        end
                    end
                end
                if fours_in_played_hand > 0 then
                    local total_mult = 0
                    SMODS.scale_card(card, {
	                    ref_table = card.ability.extra,
                        ref_value = "initial_mult",
	                    scalar_value = "mult_per_four",
                        operation = function(ref_table, ref_value, initial, change)
	                        total_mult = fours_in_played_hand * change
                        end,
                        no_message = true,
                    })
                    return {
                        mult = total_mult
                    }
                end
            end
        end
        return nil
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" },
            },
            calc_function = function(card)
                local mult = 0
                local hand = JokerDisplay.current_hand
                local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
                if text ~= 'Unknown' then
                    local fours_played = 0
                    local fours_scored = 0

                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:get_id() == 4 then
                            fours_played = fours_played + 1
                            fours_scored = fours_scored + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        end
                    end

                    mult = card.ability.extra.mult_per_four * fours_played * fours_scored
                end
                card.joker_display_values.mult = mult
                card.joker_display_values.localized_text = localize('4', 'ranks')
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {square_eyes} }
