local white_eyes = {
    object_type = "Joker",
    order = 751,
    ignore = true,

    key = "white_eyes",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 19, y = 39},
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
return { name = {"Jokers"}, items = {white_eyes} }