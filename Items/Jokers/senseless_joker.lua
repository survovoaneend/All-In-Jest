local senseless_joker = {
    object_type = "Joker",
    order = 903,
    ignore = true,

    key = "senseless_joker",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 24, y = 41},
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
return { name = {"Jokers"}, items = {senseless_joker} }