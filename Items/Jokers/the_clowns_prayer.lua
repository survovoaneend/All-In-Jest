local the_clowns_prayer = {
    object_type = "Joker",
    order = 737,
    ignore = true,

    key = "the_clowns_prayer",
    config = {

    },
    rarity = 1,
    pos = { x = 2, y = 40},
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
return { name = {"Jokers"}, items = {the_clowns_prayer} }