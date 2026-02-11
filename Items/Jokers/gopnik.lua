local gopnik = {
    object_type = "Joker",
    order = 456,
    key = "gopnik",
    
    config = {
        extra = {
            cost = 10,
            mult = 0,
            mult_mod = 5
        }
    },
    rarity = 1,
    pos = { x = 24, y = 22 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cost,
                card.ability.extra.mult,
                card.ability.extra.mult_mod,
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
            if to_big(G.GAME.dollars) >= to_big(card.ability.extra.cost)then
                return true
            end
        end,

        use_ability = function(self, card)
            ease_dollars(-card.ability.extra.cost)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
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
                mult = card.ability.extra.mult
            }
        end
    end
}

return { name = { "Jokers" }, items = { gopnik } }
