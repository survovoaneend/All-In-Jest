local word_art = {
    object_type = "Joker",
    order = 41,
   

    key = "word_art",
    config = {
      extra = {
        mult_per_card = 5
      }
    },
    rarity = 1,
    pos = { x = 13, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_per_card
            }
        }
    end,
  
    calculate = function(self, card, context)
        local _cards = 0
        if context.full_hand then
            for _, p_card_in_full_hand in ipairs(context.full_hand) do
                if p_card_in_full_hand:get_id() == 11 or p_card_in_full_hand:get_id() == 12 or p_card_in_full_hand:get_id() == 13 or p_card_in_full_hand:get_id() == 14 then
                    _cards = _cards + 1
                end
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult_per_card * _cards
            }
        end
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
                { text = "(8)" },
            },
            calc_function = function(card)
                local words = 0
                local played_hand = JokerDisplay.current_hand
                for _, scoring_card in pairs(played_hand) do
                    if scoring_card:get_id() == 11 or scoring_card:get_id() == 12 or scoring_card:get_id() == 13 or scoring_card:get_id() == 14 then
                        words = words + 1
                    end
                end
                card.joker_display_values.mult = card.ability.extra.mult_per_card * words
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {word_art} }
