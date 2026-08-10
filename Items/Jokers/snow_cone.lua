local snow_cone = {
    object_type = "Joker",
    order = 852,
    ignore = true,

    key = "snow_cone",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 24, y = 39},
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
return { name = {"Jokers"}, items = {snow_cone} }