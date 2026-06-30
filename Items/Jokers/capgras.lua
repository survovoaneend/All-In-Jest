local capgras = {
    object_type = "Joker",
    order = 707,
    ignore = true,

    key = "capgras",
    config = {

    },
    rarity = 1,
    pos = { x = 22, y = 38},
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
return { name = {"Jokers"}, items = {capgras} }