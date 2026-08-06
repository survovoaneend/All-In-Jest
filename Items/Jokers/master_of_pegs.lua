local master_of_pegs = {
    object_type = "Joker",
    order = 950,
    ignore = true,

    key = "master_of_pegs",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 24, y = 43},
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
return { name = {"Jokers"}, items = {master_of_pegs} }