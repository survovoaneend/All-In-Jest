local kaiju = {
    object_type = "Joker",
    order = 887,
    ignore = true,

    key = "kaiju",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 8, y = 41},
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
return { name = {"Jokers"}, items = {kaiju} }