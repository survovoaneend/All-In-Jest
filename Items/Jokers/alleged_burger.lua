local alleged_burger = {
    object_type = "Joker",
    order = 985,
    ignore = true,

    key = "alleged_burger",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 9, y = 45},
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
return { name = {"Jokers"}, items = {alleged_burger} }