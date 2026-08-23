local grumpy_gus = {
    object_type = "Joker",
    order = 740,

    key = "grumpy_gus",
    config = {
        extra = {
            mult = 1
        }
    },
    attributes = {'mult', 'scaling', 'discard'},
    rarity = 1,
    pos = { x = 22, y = 33},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

        return { 
            vars = {
                card.ability.extra.mult,
                G.GAME.unused_discards or 0
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = (G.GAME.unused_discards*card.ability.extra.mult) or 0
            }
        end
    end
}
return { name = {"Jokers"}, items = {grumpy_gus} }