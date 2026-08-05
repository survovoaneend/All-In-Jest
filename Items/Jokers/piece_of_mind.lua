local piece_of_mind = {
    object_type = "Joker",
    order = 990,
    ignore = true,

    key = "piece_of_mind",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 15, y = 46},
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
return { name = {"Jokers"}, items = {piece_of_mind} }