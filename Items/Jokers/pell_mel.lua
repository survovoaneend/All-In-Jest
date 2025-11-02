local pell_mel = {
    object_type = "Joker",
    order = 37,

    key = "pell_mel",
    config = {
      extra = {
        xmult_mod = 0.25,
      }
    },
    rarity = 1,
    pos = { x = 10, y = 1 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
          vars = {
            card.ability.extra.xmult_mod,
            card.ability.extra.xmult
          }
        }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "xmult",
	        scalar_value = "xmult_mod",
            operation = function(ref_table, ref_value, initial, change)
	            ref_table[ref_value] = 1 + jest_get_unique_suits(context.full_hand, nil, true) * change
            end,
            no_message = true,
        })
        return {
          xmult = card.ability.extra.xmult
        }
      end
      if context.after then
        card.ability.extra.xmult = 1
      end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                    }
                }
            },
            calc_function = function(card)
                card.joker_display_values.x_mult = 1
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    card.joker_display_values.x_mult = 1 + jest_get_unique_suits(scoring_hand, nil, true) * card.ability.extra.xmult_mod
                end
            end
        }
    end
  
}

return { name = {"Jokers"}, items = {pell_mel} }

