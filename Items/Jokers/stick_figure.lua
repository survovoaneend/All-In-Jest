local stick_figure = {
    object_type = "Joker",
    order = 820,
    ignore = true,

    key = "stick_figure",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 1, y = 38},
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
return { name = {"Jokers"}, items = {stick_figure} }