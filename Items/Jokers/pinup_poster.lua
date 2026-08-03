local pinup_poster = {
    object_type = "Joker",
    order = 828,
    ignore = true,

    key = "pinup_poster",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 2, y = 39},
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
return { name = {"Jokers"}, items = {pinup_poster} }