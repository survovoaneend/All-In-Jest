local slubberdegullion = {
    object_type = "Joker",
    order = 590,
    key = "slubberdegullion",
  
    config = {
        extra = {
            discards = 1
        }
    },
    rarity = 2,
    pos = { x = 3, y = 28 },
    atlas = 'joker_atlas',
    cost = 5,
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
        if context.before then
            if #context.full_hand - #context.scoring_hand >= 3 then
                ease_discard(card.ability.extra.discards)
                return {
                    message = localize { type = 'variable', key = 'a_aij_discards', vars = { card.ability.extra.discards } },
                    colour = G.C.RED
                }
            end
        end
    end
}


return { name = { "Jokers" }, items = { slubberdegullion } }