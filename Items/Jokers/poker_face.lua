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
    attributes = { 'xmult', 'scaling', 'reset' },
    rarity = 3,
    pos = { x = 8, y = 20 },
    atlas = 'joker_atlas',
    cost = 8,
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
         if context.joker_main then
            if card.ability.extra.xmult > 1 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        
        if context.after and not context.blueprint then
            if not SMODS.last_hand_oneshot then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "xmult_gain",
                    message_colour = G.C.MULT
                })
                return nil, true
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
