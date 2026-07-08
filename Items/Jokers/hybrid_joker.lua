local hybrid_joker = {
    object_type = "Joker",
    order = 684,
    ignore = true,

    key = "hybrid_joker",
    config = {

    },
    rarity = 1,
    pos = { x = 24, y = 37},
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
return { name = {"Jokers"}, items = {hybrid_joker} }