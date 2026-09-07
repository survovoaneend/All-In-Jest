local gelato = {
    object_type = "Joker",
    order = 853,
    
    key = "gelato",
    config = {
        extra = {
            dollars = 10
        }
    },
    attributes = {'economy', 'food'},
    rarity = 2,
    pos = { x = 0, y = 40},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.dollars
            }
         }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint and G.GAME.current_round.hands_played > 0 then
            SMODS.destroy_cards(card, nil, nil, true)
            return {
                message = localize('k_melted_ex'),
                colour = G.C.RED
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}
return { name = {"Jokers"}, items = {gelato} }