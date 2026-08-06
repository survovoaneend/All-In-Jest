local big_fish = {
    object_type = "Joker",
    order = 996,
    ignore = true,

    key = "big_fish",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 2, y = 47},
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
return { name = {"Jokers"}, items = {big_fish} }