local dark_presence = {
    object_type = "Joker",
    order = 749,
    ignore = true,

    key = "dark_presence",
    config = {

    },
    rarity = 1,
    pos = { x = 11, y = 40},
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
return { name = {"Jokers"}, items = {dark_presence} }