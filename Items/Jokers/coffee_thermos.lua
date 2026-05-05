local coffee_thermos = {
    object_type = "Joker",
    order = 640,

    key = "coffee_thermos",
    config = {
        extra = {
            total_rounds = 3,
            rounds = 3
        }
    },
    rarity = 1,
    pos = { x = 7, y = 30},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    ignore = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    pools = {
        Food = true
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rounds,
            }
        }
    end,

    calculate = function(self, card, context)
        local other_context = context.other_context
        if other_context and other_context.end_of_round and other_context.main_eval then
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize('k_again_ex'),
                colour = G.C.FILTER
            })
            return {
                repetitions = 1,
            } 
        end
        if context.end_of_round and context.main_eval then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = (card.ability.extra.rounds <= 0) and localize('k_eaten_ex') or
                (card.ability.extra.rounds .. '/' .. card.ability.extra.total_rounds),
                colour = (card.ability.extra.rounds <= 0) and G.C.RED or
                G.C.FILTER, 
            })
            if card.ability.extra.rounds <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                })
            end
        end
    end
}
return { name = {"Jokers"}, items = {coffee_thermos} }