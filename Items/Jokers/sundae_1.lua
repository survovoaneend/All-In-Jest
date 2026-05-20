local sundae = {
    object_type = "Joker",
    order = 506,

    key = "sundae_1",
    config = {
        extra = {
            chips = 150,
            rounds = 3,
            total_rounds = 3,
        }
    },
    rarity = 1,
    pos = { x = 24, y = 21 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    no_collection = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.rounds,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
            }
        end
        if context.end_of_round and not context.blueprint and context.main_eval then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = (card.ability.extra.rounds <= 0) and localize('k_melted_ex') or
                (card.ability.extra.rounds .. '/' .. card.ability.extra.total_rounds),
                colour = G.C.FILTER
            })
            if card.ability.extra.rounds <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.CHIPS
                }
            else
                return nil, true
            end
        end
    end,
    
    in_pool = function(self)
        return false
    end,
}
return { name = { "Jokers" }, items = { sundae } }
