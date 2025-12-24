local splat = {
    object_type = "Joker",
    order = 422,
    key = "splat",
    config = {
        extra = {
            odds = 6,
        }
    },
    rarity = 2,
    pos = { x = 22, y = 20 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_SEALS['aij_melted']
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            local other_card = context.other_card
            local juice_card = context.blueprint_card or card
            if SMODS.pseudorandom_probability(card, 'splat'.. G.SEED, 1, card.ability.extra.odds) then
                G.E_MANAGER:add_event(Event ({
                    trigger = 'before',
                    func = function()
                        other_card:set_seal('aij_melted', true)
                        other_card:juice_up(0.3,0.3)
                        play_sound('gold_seal', 1.2, 0.4)
                        
                        return true
                    end 
                }))
                card_eval_status_text(juice_card, 'extra', nil, nil, nil, {
                    message = localize('k_aij_splat_ex')
                })
            end
        end
    end
}

return { name = { "Jokers" }, items = { splat } }
