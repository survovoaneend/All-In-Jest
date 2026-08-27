local drying_paint = {
    object_type = "Joker",
    order = 670,

    key = "drying_paint",
    config = {
        extra = {
            xmult = 1,
            xmult_mod = 0.2,
            hand_cost = 1
        }
    },
    attributes = { "xmult", "scaling", "hands" },
    rarity = 3,
    pos = { x = 2, y = 30},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    all_in_jest = {
        can_use_ability = function(self, card, context)
            if G.GAME and G.GAME.blind and G.GAME.current_round.hands_left > 1 and G.STATE == G.STATES.SELECTING_HAND then
                return true
            end
        end,

        use_ability = function(self, card)
            if G.GAME.current_round.hands_left > 1 then
                ease_hands_played(-card.ability.extra.hand_cost)
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize{type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult }}
                })
            end
        end,
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult,
                card.ability.extra.hand_cost,
                colours = {
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.xmult > 1 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
return { name = {"Jokers"}, items = {drying_paint} }