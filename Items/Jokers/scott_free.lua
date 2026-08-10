local scott_free = {
    object_type = "Joker",
    order = 988,
    ignore = true,

    key = "scott_free",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 12, y = 45},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { }
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {scott_free} }