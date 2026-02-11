local headache = {
    object_type = "Joker",
    order = 457,
    key = "headache",
    config = {
        extra = {
            reroll_sale = 1,
            mult = 15
        }
    },
    rarity = 1,
    pos = { x = 0, y = 23 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.reroll_sale,
                card.ability.extra.mult
            }
        }
    end,
    --repurposed from jongluer
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + card.ability.extra.reroll_sale
        G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + card.ability.extra.reroll_sale)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.reroll_sale
        G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - card.ability.extra.reroll_sale)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

return { name = { "Jokers" }, items = { headache } }
