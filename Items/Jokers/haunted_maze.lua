local haunted_maze = {
    object_type = "Joker",
    order = 941,
    ignore = true,

    key = "haunted_maze",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 15, y = 43},
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
return { name = {"Jokers"}, items = {haunted_maze} }