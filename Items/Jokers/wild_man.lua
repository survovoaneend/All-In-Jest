local wild_man = {
    object_type = "Joker",
    order = 647,
    ignore = true,

    key = "wild_man",
    config = {

    },
    rarity = 1,
    pos = { x = 14, y = 30},
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
return { name = {"Jokers"}, items = {wild_man} }