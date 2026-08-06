local the_judge = {
    object_type = "Joker",
    order = 829,
    ignore = true,

    key = "the_judge",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 3, y = 39},
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
return { name = {"Jokers"}, items = {the_judge} }