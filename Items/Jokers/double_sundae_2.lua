local double_sundae = {
    object_type = "Joker",
    order = 506,

    key = "double_sundae_2",
    config = {
        extra = {
            chips = 150,
            dollars = 10,
            rounds = 3,
            total_rounds = 3,
        }
    },
    rarity = 2,
    pos = { x = 21, y = 21 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    no_collection = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.dollars,
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
            ease_dollars(card.ability.extra.dollars)
            card_eval_status_text(card, 'dollars', card.ability.extra.dollars)
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = (card.ability.extra.rounds <= 0) and localize('k_melted_ex') or
                (card.ability.extra.rounds .. '/' .. card.ability.extra.total_rounds),
                colour = G.C.FILTER
            })
            if card.ability.extra.rounds <= 0 then
                local sundae_key = pseudorandom_element({1,3}, pseudoseed('jest_double_sundae'))
                local key = 'j_aij_sundae_'.. sundae_key
                All_in_Jest.reroll_joker(card, key, 'jest_double_sundae')
            end
        end
    end,
    
    in_pool = function(self)
        return false
    end,
}
return { name = { "Jokers" }, items = { double_sundae } }
