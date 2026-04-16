local coffee_thermos = {
    object_type = "Joker",
    order = 640,
    ignore = true,

    key = "coffee_thermos",
    config = {

    },
    rarity = 1,
    pos = { x = 7, y = 30},
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
return { name = {"Jokers"}, items = {coffee_thermos} }