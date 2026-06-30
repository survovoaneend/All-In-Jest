local connect_the_dots = {
    object_type = "Joker",
    order = 682,
    ignore = true,

    key = "connect_the_dots",
    config = {

    },
    rarity = 1,
    pos = { x = 22, y = 37},
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
return { name = {"Jokers"}, items = {connect_the_dots} }