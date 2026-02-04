local phoney_baloney = {
    object_type = "Joker",
    order = 195,

    key = "phoney_baloney",
    config = {
        extra = {
            rerolls = 5,
            rerolls_remaining = 5
        }
    },
    rarity = 2,
    pos = { x = 9, y = 7 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rerolls_remaining,
                card.ability.extra.rerolls
            }
        }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            card.ability.extra.rerolls_remaining = card.ability.extra.rerolls_remaining - 1
            G.GAME.current_round.free_rerolls = card.ability.extra.rerolls_remaining
            calculate_reroll_cost(true)
            if card.ability.extra.rerolls_remaining <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            else
                return {
                    message = localize { type = 'variable', key = 'a_remaining', vars = { card.ability.extra.rerolls_remaining } },
                    colour = G.C.FILTER
                }
            end
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            if context.beat_boss then
                card.ability.extra.rerolls_remaining = card.ability.extra.rerolls_remaining + card.ability.extra.rerolls

                return {
                    message = localize { type = 'variable', key = 'a_aij_plus_rerolls', vars = { card.ability.extra.rerolls } },
                    colour = G.C.FILTER
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.rerolls_remaining)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-card.ability.extra.rerolls_remaining)
    end

}
return { name = { "Jokers" }, items = { phoney_baloney } }
