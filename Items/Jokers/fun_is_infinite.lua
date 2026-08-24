local fun_is_infinite = {
    object_type = "Joker",
    order = 844,
    ignore = true,

    key = "fun_is_infinite",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 16, y = 39},
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
return { name = {"Jokers"}, items = {fun_is_infinite} }