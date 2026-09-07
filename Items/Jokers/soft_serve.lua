local soft_serve = {
    object_type = "Joker",
    order = 541,
    key = "soft_serve",
    config = {
        extra = {
            total_purchases = 4,
            purchases_left = 4
        }
    },
    attributes = { 'passive', 'food', 'joker', 'tarot', 'planet', 'shop_slot', },
    rarity = 1,
    pos = { x = 7, y = 25 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.purchases_left,
                card.ability.extra.total_purchases
            }
        }
    end,

    calculate = function(self, card, context)
        if context.modify_final_cashout and not context.blueprint then
            G.GAME.aij_exculde_vanilla_in_shop = G.GAME.aij_exculde_vanilla_in_shop or {['Joker'] = true, ['Tarot'] = true, ['Tarot_Planet'] = true, ['Planet'] = true}
        end
        if not context.buying_self and context.buying_card and context.card.config.center.set and (G.GAME.aij_exculde_vanilla_in_shop[context.card.config.center.set] or context.card.config.center.set == 'Booster') and not context.blueprint then
            G.GAME.aij_soft_serve_trigger = nil
            local remaining_mod = {}
            remaining_mod.num = 1
            if (card.ability.extra.purchases_left - 1) <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "purchases_left",
                    scalar_table = remaining_mod,
                    scalar_value = "num",
                    operation = '-',
                    scaling_message = {
                        message = localize{key='a_remaining', type='variable', vars={card.ability.extra.purchases_left-1}},
                        colour = G.C.FILTER
                    },
                })
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.aij_exculde_vanilla_in_shop = nil
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.aij_exculde_vanilla_in_shop = {['Joker'] = true, ['Tarot'] = true, ['Tarot_Planet'] = true, ['Planet'] = true}
    end,
}

return { name = { "Jokers" }, items = { soft_serve } }
