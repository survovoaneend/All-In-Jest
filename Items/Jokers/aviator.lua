local aviator = {
    object_type = "Joker",
    order = 747,
    ignore = true,

    key = "aviator",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 15, y = 39},
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
return { name = {"Jokers"}, items = {aviator} }