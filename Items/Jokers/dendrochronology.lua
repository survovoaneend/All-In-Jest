local dendrochronology = {
    object_type = "Joker",
    order = 649,
    ignore = true,

    key = "dendrochronology",
    config = {

    },
    rarity = 1,
    pos = { x = 16, y = 30},
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
return { name = {"Jokers"}, items = {dendrochronology} }