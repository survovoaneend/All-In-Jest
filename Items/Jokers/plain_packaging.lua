local plain_packaging = {
    object_type = "Joker",
    order = 114,

    key = "plain_packaging",
    config = {
        extra = {
            mult = 20,
            mult_decrease = 5
        }
    },
    rarity = 1,
    pos = { x = 9, y = 4 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_decrease
            }
        }
    end,

    calculate = function(self, card, context)
        if context.jest_destroying_or_selling_joker and not context.blueprint then
            if card.ability.extra.mult - card.ability.extra.mult_decrease <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_aij_empty_ex'),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_decrease
                return {
                    message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.mult_decrease } },
                    colour = G.C.RED,
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
return { name = { "Jokers" }, items = { plain_packaging } }
