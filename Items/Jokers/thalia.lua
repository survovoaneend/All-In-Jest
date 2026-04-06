local thalia = {
    object_type = "Joker",
    order = 1067,

    key = "thalia",
    config = {
        extra = { retriggers = 1 }
    },
    rarity = 4,
    pos = { x = 9, y = 10 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 9, y = 11 },

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.retriggers}}
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.discard and
            G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
            context.full_hand[1].ability.perma_repetitions = context.full_hand[1].ability.perma_repetitions + card.ability.extra.retriggers
            return {
                extra = { message = localize('k_upgrade_ex'), focus = context.full_hand[1], colour = G.C.FILTER },
                colour = G.C.FILTER,
                card = context.full_hand[1]
            }
        end
    end,
}
return { name = { "Jokers" }, items = { thalia } }
