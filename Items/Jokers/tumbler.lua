local tumbler = {
    object_type = "Joker",
    order = 113,

    key = "tumbler",
    config = {
        extra = {
            Xmult = 3,
            Xmult_loss = 0.02
        }
    },
    rarity = 2,
    pos = { x = 8, y = 4 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult,
                card.ability.extra.Xmult_loss
            }
        }
    end,

    calculate = function(self, card, context)
        if context.aij_card_highlight and (G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.DRAW_TO_HAND) and G.GAME.STOP_USE <= 0 and not context.blueprint then
            if card.ability.extra.Xmult - card.ability.extra.Xmult_loss <= 1 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_aij_empty_ex'),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.Xmult_loss
                return {
                    message = localize { type = 'variable', key = 'a_xmult_minus', vars = { card.ability.extra.Xmult_loss } },
                    colour = G.C.RED,
                    delay = 0.2
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end

}
return { name = { "Jokers" }, items = { tumbler } }
