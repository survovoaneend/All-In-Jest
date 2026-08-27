local plum_pudding = {
    object_type = "Joker",
    order = 947,
    ignore = true,

    key = "plum_pudding",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 21, y = 43},
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
return { name = {"Jokers"}, items = {plum_pudding} }