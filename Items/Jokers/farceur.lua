local farceur = {
    object_type = "Joker",
    order = 742,

    key = "farceur",
    config = {
        extra = {
            cost = 5,
            xmult = 0,
            xmult_mod = 0.1
        }
    },
    attributes = { 'activated', 'lose_economy', 'xmult', 'scaling' },
    rarity = 3,
    pos = { x = 24, y = 33},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cost,
                1+card.ability.extra.xmult,
                card.ability.extra.xmult_mod,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,
    all_in_jest = {
        ability_cost = function(self, card)
             return card.ability.extra.cost
        end,
        
        can_use_ability = function(self, card, context)
            if (G.GAME.dollars - G.GAME.bankrupt_at) >= card.ability.extra.cost then
                return true
            end
        end,

        use_ability = function(self, card, args)
            args = args or {}
            SMODS.calculate_context({all_in_jest = {joker_ability_used = true, card = card, retriggered = args.retriggered, args = args}})
            if not args.free then ease_dollars(-card.ability.extra.cost) end
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_mod",
            })
        end,
    },
    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or 0
        end
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = 1+card.ability.extra.xmult
            }
        end
    end
}
return { name = {"Jokers"}, items = {farceur} }