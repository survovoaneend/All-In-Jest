local bogdonoff = {
    object_type = "Joker",
    order = 1071,
    key = "bogdonoff",
    config = {
        extra = {
            debt_limit = 50
        }
    },
    rarity = 4,
    pos = { x = 8, y = 12 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 8, y = 13 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.debt_limit
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.debt_limit
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.debt_limit
    end,
    calculate = function(self, card, context)
        if context.ending_shop then
            ease_dollars(-G.GAME.dollars)
            return {
                message = localize('k_reset'),
                colour = G.C.MONEY
            }
        end
    end
}
return { name = { "Jokers" }, items = { bogdonoff } }
