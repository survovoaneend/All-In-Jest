local voynich_joker = {
    object_type = "Joker",
    order = 906,
    ignore = true,

    key = "voynich_joker",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 2, y = 42},
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
return { name = {"Jokers"}, items = {voynich_joker} }