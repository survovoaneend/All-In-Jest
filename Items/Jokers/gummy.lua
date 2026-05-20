local gummy = {
    object_type = "Joker",
    order = 622,
    key = "gummy",
    config = {
        extra = {
            chips = 15,
            mult = 2
        }
    },
    rarity = 1,
    pos = { x = 10, y = 29 },
    atlas = 'joker_atlas',
    cost = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips, card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end
}
return { name = {"Jokers"}, items = {gummy} }
