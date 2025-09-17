local chippy = {
    object_type = "Joker",
    order = 221,

    key = "chippy",
    config = {
      extra = {
          chips = 0
      }
    },
    rarity = 2,
    pos = { x = 10, y = 8},
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
          card.ability.extra.chips,
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.money_altered and context.amount < 0 and not context.blueprint then
        SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "chips",
            scalar_table = context,
	        scalar_value = "amount",
            operation = function(ref_table, ref_value, initial, change)
	            ref_table[ref_value] = initial + -change
            end,
            scaling_message = {
	            message = localize('k_upgrade_ex'),
	            colour = G.C.FILTER
            },
            block_overrides = {
	            value = true,
	            scalar = true,
	            message = true,
            }
        })
      end
      if context.joker_main and to_number(card.ability.extra.chips) > 0 then
        return {
          chips = to_number(card.ability.extra.chips),
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {chippy} }
