local you_are_susceptible = {
    object_type = "Joker",
    order = 841,
    ignore = true,

    key = "you_are_susceptible",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 13, y = 39},
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
return { name = {"Jokers"}, items = {you_are_susceptible} }