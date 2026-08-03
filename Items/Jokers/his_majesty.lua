local his_majesty = {
    object_type = "Joker",
    order = 913,
    ignore = true,

    key = "his_majesty",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 9, y = 42},
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
return { name = {"Jokers"}, items = {his_majesty} }