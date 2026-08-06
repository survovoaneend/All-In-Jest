local the_hare = {
    object_type = "Joker",
    order = 966,
    ignore = true,

    key = "the_hare",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 15, y = 44},
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
return { name = {"Jokers"}, items = {the_hare} }