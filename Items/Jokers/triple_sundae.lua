local triple_sundae = {
    object_type = "Joker",
    order = 506,

    key = "triple_sundae",
    config = {
        extra = {
            chips = 150,
            mult = 30,
            dollars = 10,
            rounds = 3,
            total_rounds = 3,
        }
    },
    rarity = 3,
    pos = { x = 20, y = 21 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    pools = {
        Food = true
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.dollars,
                card.ability.extra.rounds,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
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
                local double_key = pseudorandom_element({1,2,3}, pseudoseed('jest_triple_sundae'))
                local key = 'j_aij_double_sundae_'.. double_key
                All_in_Jest.reroll_joker(card, key, 'jest_triple_sundae')
            end
        end
    end,
}
return { name = { "Jokers" }, items = { triple_sundae } }
