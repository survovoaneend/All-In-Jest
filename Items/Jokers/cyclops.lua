local cyclops = {
    object_type = "Joker",
    order = 177,
    key = "cyclops",
    config = {
        extra = {
            mult = 0,
            mult_mod = 3,
        }
    },
    attributes = { 'hands', 'mult', 'scaling', },
    rarity = 3,
    pos = { x = 20, y = 6 },
    ignore = true,
    atlas = 'joker_atlas',
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_mod,
                card.ability.extra.mult
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.before and context.full_hand and #context.full_hand == 1 and G.GAME.current_round.hands_played == 0 then
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "mult",
	            scalar_value = "mult_mod",
            })
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end
}
return { name = { "Jokers" }, items = { cyclops } }
