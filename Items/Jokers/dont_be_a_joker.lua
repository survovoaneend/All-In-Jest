local dont_be_a_joker = {
    object_type = "Joker",
    order = 410,
    key = "dont_be_a_joker",
    config = {
        extra = {
            
        }
    },
    rarity = 3,
    pos = { x = 13, y = 20 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if (context.selling_card or context.joker_type_destroyed) and context.card.ability.set == "Joker" then
            SMODS.scale_card(card, {
	            ref_table = card.ability,
                ref_value = "extra_value",
                scalar_table = context.card,
	            scalar_value = "sell_cost",
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

return { name = { "Jokers" }, items = { dont_be_a_joker } }
