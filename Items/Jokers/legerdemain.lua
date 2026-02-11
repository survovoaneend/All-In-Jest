local legerdemain = {
    object_type = "Joker",
    order = 436,
    key = "legerdemain",
    
    config = {
        extra = {
            discards = 2
        }
    },
    rarity = 1,
    pos = { x = 6, y = 22 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.discards
            }
        }
    end,

    calculate = function(self, card, context)
        if context.selling_card and context.card.ability.set == 'Joker' and G.STATE == G.STATES.SELECTING_HAND then
            ease_discard(card.ability.extra.discards)
            return {
                message = localize { type = 'variable', key = 'a_aij_discards', vars = { card.ability.extra.discards } },
                colour = G.C.RED
            }
        end
    end
}

return { name = { "Jokers" }, items = { legerdemain } }
