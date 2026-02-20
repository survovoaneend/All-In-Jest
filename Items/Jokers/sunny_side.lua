local sunny_side = {
    object_type = "Joker",
    order = 255,
    key = "sunny_side",
    config = {
      
    },
    rarity = 2,
    pos = { x = 2, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.money_altered and to_big(context.amount) >= to_big(1) and not context.blueprint and not card.ability.jest_sold_self and not context.selling_self then
            ease_dollars(-context.amount)
            card_eval_status_text(card, 'dollars', -context.amount)
            SMODS.scale_card(card, {
	            ref_table = card.ability,
                ref_value = "extra_value",
                scalar_table = context,
	            scalar_value = "amount",
                operation = function(ref_table, ref_value, initial, change)
	                ref_table[ref_value] = initial + (change * 2)
                end,
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
return { name = {"Jokers"}, items = {sunny_side} }
