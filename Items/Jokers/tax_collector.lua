local tax_collector = {
    object_type = "Joker",
    order = 905,
    ignore = true,

    key = "tax_collector",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 6, y = 43},
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
return { name = {"Jokers"}, items = {tax_collector} }