local hallucinaut = {
    object_type = "Joker",
    order = 607,
    key = "hallucinaut",
    
    config = {
        extra = {
            xmult = 1, 
            xmult_gain = 0.5
        }
    },
    rarity = 2,
    pos = { x = 21, y = 28 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,


    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_gain, 
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
         if context.open_booster and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                message = localize{type='variable', key='a_xmult', vars={card.ability.extra.xmult}},
                colour = G.C.MULT
            }
        end
        if context.end_of_round and context.main_eval and context.beat_boss and not context.blueprint then
            if card.ability.extra.xmult > 1 then
                card.ability.extra.xmult = 1
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}


return { name = { "Jokers" }, items = { hallucinaut } }