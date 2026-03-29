local halter_sack = {
    object_type = "Joker",
    order = 605,
    key = "halter_sack",
    
    config = {
        extra = { 
            base_xmult = 3, 
            loss = 0.5
        }
    },
    rarity = 2,
    pos = { x = 19, y = 28 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,


    loc_vars = function(self, info_queue, card)
        local current_xmult = math.max(1, card.ability.extra.base_xmult - ((G.GAME.current_round.discards_used or 0) * card.ability.extra.loss))
        return {
            vars = {
                card.ability.extra.base_xmult, card.ability.extra.loss, current_xmult 
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if #context.scoring_hand >= 4 then
                local current_xmult = math.max(1, card.ability.extra.base_xmult - (G.GAME.current_round.discards_used * card.ability.extra.loss))
                if current_xmult > 1 then
                    return {
                        xmult = current_xmult
                    }
                end
            end
        end
        if context.pre_discard then
            local current_xmult = math.max(1, card.ability.extra.base_xmult - ((G.GAME.current_round.discards_used + 1 or 1) * card.ability.extra.loss))
            return {
                message = localize{type='variable', key='a_xmult', vars={current_xmult}},
                colour = G.C.MULT
            }
        end
    end
}


return { name = { "Jokers" }, items = { halter_sack } }