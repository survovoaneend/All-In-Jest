local dark_angel = {
    object_type = "Joker",
    order = 984,
    ignore = true,

    key = "dark_angel",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 8, y = 45},
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
return { name = {"Jokers"}, items = {dark_angel} }