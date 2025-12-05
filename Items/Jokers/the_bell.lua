local the_bell = {
    object_type = "Joker",
    order = 503,

    key = "the_bell",
    config = {
        extra = {
            cost = 5,
        }
    },
    rarity = 3,
    pos = { x = 5, y = 22 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    all_in_jest = {
        ability_cost = function(self, card)
            return card.ability.extra.cost
        end,

        can_use_ability = function(self, card, context)
            local active = false
            for k, v in pairs(G.GAME.current_round.voucher) do
                if G.GAME.current_round.voucher.spawn[G.GAME.current_round.voucher[1]] then
                    active = true
                end
            end
            if active and to_big(G.GAME.dollars) >= to_big(card.ability.extra.cost) and (G.shop_vouchers and G.shop_vouchers.cards and G.shop_vouchers.cards[1]) then
                return true
            end
        end,

        use_ability = function(self, card)
            ease_dollars(-card.ability.extra.cost)
            card_eval_status_text(card, 'dollars', -card.ability.extra.cost)
            All_in_Jest.reroll_shop_voucher()
        end,
    },

    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or "??"
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cost,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    calculate = function(self, card, context)
        
    end
}
return { name = { "Jokers" }, items = { the_bell } }
