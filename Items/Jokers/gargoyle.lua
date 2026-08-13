local gargoyle = {
    object_type = "Joker",
    order = 926,
    ignore = true,

    key = "gargoyle",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 0, y = 43},
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
return { name = {"Jokers"}, items = {gargoyle} }