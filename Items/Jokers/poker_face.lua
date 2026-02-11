local poker_face = {
    object_type = "Joker",
    order = 430,
    key = "poker_face",
    
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 1
        }
    },
    rarity = 3,
    pos = { x = 8, y = 20 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
         if context.joker_main then
            if card.ability.extra.xmult > 1 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        
        if context.after and not context.blueprint then
            if not SMODS.last_hand_oneshot then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            else
                if card.ability.extra.xmult > 1 then
                    card.ability.extra.xmult = 1
                    return {
                        message = localize('k_reset'),
                        colour = G.C.RED
                    }
                end
            end
        end
    end
}

return { name = { "Jokers" }, items = { poker_face } }
