local lawfirm = {
    object_type = "Joker",
    order = 553,
    key = "lawfirm",
    config = {
        extra = {
            active = true,
            cost = 5,
            odds = 2
        }
    },
    rarity = 2,
    pos = { x = 16, y = 26 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    ignore = true,

    all_in_jest = {
        ability_cost = function(self, card)
            return card.ability.extra.cost
        end,

        can_use_ability = function(self, card, context)
            if card.ability.extra.active and G.GAME.blind and G.GAME.blind.boss then
                return true
            end
        end,

        use_ability = function(self, card)
            if to_big(G.GAME.dollars) >= to_big(card.ability.extra.cost) then
                ease_dollars(-card.ability.extra.cost)
                card_eval_status_text(card, 'dollars', -card.ability.extra.cost)
                if SMODS.pseudorandom_probability(card, 'lawfirm', 1, card.ability.extra.odds) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    delay(0.4)
                                    return true
                                end }))
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                        return true
                    end }))
                end
                card.ability.extra.active = false
            end
        end,
    },

    loc_vars = function(self, info_queue, card)
        local active_text = ""
        if not card.ability.extra.active then
            active_text = "(" .. localize('k_inactive') .. ")"
        else
            active_text = "(" .. localize('k_active') .. ")"
        end
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'lawfirm')
        return {
            vars = {
                numerator, denominator,
                card.ability.extra.cost,
                active_text,
                colours = {
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or "??"
        end
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.active = true
        end
    end
}

return { name = { "Jokers" }, items = { lawfirm } }
