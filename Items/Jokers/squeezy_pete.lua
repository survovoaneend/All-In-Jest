local squeezy_pete = {
  object_type = "Joker",
  order = 13,

  key = "squeezy_pete",

  config = {
      extra = {
          bonus = 0.5,
          xmult = 1
      }
  },

  rarity = 2,
  pos = { x = 12, y = 0 },
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
      return {
          vars = {
              card.ability.extra.bonus,
              card.ability.extra.xmult
          }
      }
  end,

  calculate = function(self, card, context)
      if context.before and context.scoring_name then
          if not context.blueprint then
              if context.poker_hands and next(context.poker_hands['Full House']) then
                  SMODS.scale_card(card, {
	                  ref_table = card.ability.extra,
                      ref_value = "xmult",
	                  scalar_value = "bonus",
                      operation = '+',
                      scaling_message = {
	                      message = localize('k_upgrade_ex'),
	                      colour = G.C.FILTER
                      }
                  })
                  return nil, true
              else
                  if card.ability.extra.xmult > 1 then
                      card.ability.extra.xmult = 1
                      card_eval_status_text(card, 'extra', nil, nil, nil, {
                          message = 'Reset!',
                      })
                      return nil, true
                  end
              end
          end
      end

      if context.joker_main then
          if card.ability.extra.xmult > 1 then
              return {
                  xmult = card.ability.extra.xmult,
              }
          end
      end

      return nil
  end,
  
  joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" }
            },
            calc_function = function(card)
                card.joker_display_values.localized_text = localize('Full House', 'poker_hands')
            end
        }
    end
}
return { name = {"Jokers"}, items = {squeezy_pete} }
