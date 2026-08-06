local unpardonable_sin = {
    object_type = "Joker",
    order = 889,
    ignore = true,

    key = "unpardonable_sin",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 10, y = 41},
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
return { name = {"Jokers"}, items = {unpardonable_sin} }