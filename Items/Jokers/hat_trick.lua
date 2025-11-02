local hat_trick = {
    object_type = "Joker",
    order = 12,

    key = "hat_trick",
    config = {
      extra = {
        mod = 1
      }
    },
    rarity = 1,
    pos = { x = 11, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
          vars = {
              card.ability.extra.mod,
          }
      }
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
        local multt = to_number(G.GAME.hands['Three of a Kind'].level) * card.ability.extra.mod
        if context.other_card:get_id() == 3 then 
            return {
                mult = multt,
                card = card
            }
        end
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
                { text = "(3)" }
            },
            calc_function = function(card)
                local mult = 0
                local multt = to_number(G.GAME.hands['Three of a Kind'].level)
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:get_id() == 3 then
                            mult = mult + multt * JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        end
                    end
                end
                card.joker_display_values.mult = mult
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {hat_trick} }
