local cheerio = {
    object_type = "Joker",
    order = 943,
    key = "cheerio",
    config = {
        extra = {
            chips = 100,
        }
    },
    attributes = {'reroll', 'chips', 'food'},
    rarity = 1,
    pos = { x = 17, y = 43},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips - context.cost
            if card.ability.extra.chips <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                return {
                    message = localize { type = 'variable', key = 'a_chips_minus', vars = { context.cost } },
                    colour = G.C.BLUE
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}
return { name = {"Jokers"}, items = {cheerio} }