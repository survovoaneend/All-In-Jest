local saveloy = {
    object_type = "Joker",
    order = 942,

    key = "saveloy",
    config = {
        extra = {
            mult = 20,
            mult_loss = 1
        }
    },
    attributes = {'reroll', 'mult', 'food'},
    rarity = 1,
    pos = { x = 16, y = 43},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_loss
            }
         }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
            if card.ability.extra.mult <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                return {
                    message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.mult_loss } },
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
return { name = {"Jokers"}, items = {saveloy} }