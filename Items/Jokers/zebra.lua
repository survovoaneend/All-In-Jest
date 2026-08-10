local zebra = {
    object_type = "Joker",
    order = 983,
    ignore = true,

    key = "zebra",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 6, y = 46},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { }
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {zebra} }