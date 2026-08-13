local black_belt = {
    object_type = "Joker",
    order = 980,
    ignore = true,

    key = "black_belt",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 3, y = 46},
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
return { name = {"Jokers"}, items = {black_belt} }