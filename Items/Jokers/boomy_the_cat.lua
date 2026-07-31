local boomy_the_cat = {
    object_type = "Joker",
    order = 831,
    ignore = true,

    key = "boomy_the_cat",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 5, y = 40},
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
return { name = {"Jokers"}, items = {boomy_the_cat} }