local one_bit_joker = {
    object_type = "Joker",
    order = 991,
    ignore = true,

    key = "one_bit_joker",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 16, y = 46},
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
return { name = {"Jokers"}, items = {one_bit_joker} }