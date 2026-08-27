local cutting_board = {
    object_type = "Joker",
    order = 834,
    ignore = true,

    key = "cutting_board",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 16, y = 45},
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
return { name = {"Jokers"}, items = {cutting_board} }