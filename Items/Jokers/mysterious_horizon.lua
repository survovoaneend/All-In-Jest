local mysterious_horizon = {
    object_type = "Joker",
    order = 947,
    ignore = true,

    key = "mysterious_horizon",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 23, y = 44},
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
return { name = {"Jokers"}, items = {mysterious_horizon} }