local atemporal_taco = {
    object_type = "Joker",
    order = 954,
    ignore = true,

    key = "atemporal_taco",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 5, y = 45},
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
return { name = {"Jokers"}, items = {atemporal_taco} }