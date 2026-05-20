local party_time = {
    object_type = "Joker",
    order = 517,

    key = "party_time",
    config = {
        extra = {
            chip_mod = 2
        }
    },
    rarity = 1,
    pos = { x = 17, y = 24 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.chip_mod,
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.jokers and #G.jokers.cards > 0 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize('k_aij_party_time'),
                colour = G.C.FILTER
            })
            for k, v in pairs(G.jokers.cards) do
                v.ability.perma_bonus = v.ability.perma_bonus or 0
                v.ability.perma_bonus = v.ability.perma_bonus + card.ability.extra.chip_mod
                card_eval_status_text(v, 'extra', nil, nil, nil, {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                })
            end
        end
    end
}
return { name = { "Jokers" }, items = { party_time } }
