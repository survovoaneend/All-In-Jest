local mixel_perfect = {
    object_type = "Joker",
    order = 115,
    lite = true,
    key = "mixel_perfect",
    config = {
      extra = {
        mult = 9
      }
    },
    rarity = 1,
    pos = { x = 10, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main and math.fmod(#context.scoring_hand, 2) == 1 then
        return {
          mult = card.ability.extra.mult
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
            calc_function = function(card)
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                card.joker_display_values.mult = 0
                if text ~= 'Unknown' then
                    if math.fmod(#scoring_hand, 2) == 1 then
                        card.joker_display_values.mult = card.ability.extra.mult or 0
                    end
                end
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {mixel_perfect} }
