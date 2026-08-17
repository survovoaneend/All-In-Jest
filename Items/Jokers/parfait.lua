local parfait = {
    object_type = "Joker",
    order = 856,
    
    key = "parfait",
    config = {
        extra = {
            xmult_gain = 0.5,
            odds = 10
        }
    },
    attributes = { 'perma_bonus', 'food', 'xmult', 'joker'},
    rarity = 2,
    pos = { x = 3, y = 40},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'sacrificial_catalyst')
        return { 
            vars = {
                numerator,
                denominator,
                card.ability.extra.xmult_gain, 
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'parfait', 1, card.ability.extra.odds) then
                local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end

                local right_joker = my_pos and G.jokers.cards[my_pos + 1] or nil

                if right_joker then
                    right_joker.ability.perma_x_mult = (right_joker.ability.perma_x_mult or 0) + card.ability.extra.xmult_gain
                    card_eval_status_text(right_joker, 'extra', nil, nil, nil, {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    })
                end

                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_melted_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {parfait} }