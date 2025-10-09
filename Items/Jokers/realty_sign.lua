local realty_sign = {
    object_type = "Joker",
    order = 83,

    key = "realty_sign",
    config = {
      extra = { sell_increase = 3 }
    },
    rarity = 1,
    pos = { x = 3, y = 3 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true, -- Egg can be eternal, so should this
  
    loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.sell_increase} }
    end,
  
    calculate = function(self, card, context)
        if not context.blueprint and context.before and context.scoring_name == 'Full House' then 
            SMODS.scale_card(card, {
	            ref_table = card.ability,
                ref_value = "extra_value",
                scalar_table = card.ability.extra,
	            scalar_value = "sell_increase",
                operation = '+',
                scaling_message = {
	                message = localize('k_val_up'),
                    colour = G.C.MONEY
                },
                block_overrides = {
	                value = true,
	                scalar = true,
	                message = true,
                }
            })
            card:set_cost()
          end
    end
  
}
return { name = {"Jokers"}, items = {realty_sign} }
