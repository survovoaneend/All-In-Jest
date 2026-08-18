local stracciatella = {
    object_type = "Joker",
    order = 855,   
    key = "stracciatella",
    config = {
        extra = {
            dollars = 2,
            odds = 10
        }
    },
    attributes = {'food', 'economy', 'modify_card', 'perma_bonus'},
    rarity = 1,
    pos = { x = 2, y = 40},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'stracciatella')
        return { 
            vars = { 
                numerator, 
                denominator, 
                card.ability.extra.dollars 
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'stracciatella', 1, card.ability.extra.odds) then
                for _, scored_card in ipairs(context.scoring_hand) do
                    scored_card.ability.perma_p_dollars = (scored_card.ability.perma_p_dollars or 0) + card.ability.extra.dollars
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end

                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_melted_ex'),
                    colour = G.C.MONEY
                }
            end
        end
    end,
    
}
return { name = {"Jokers"}, items = {stracciatella} }