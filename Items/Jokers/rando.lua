local rando = {
    object_type = "Joker",
    order = 770,
    ignore = true,

    key = "rando",
    config = {

    },
    rarity = 1,
    pos = { x = 7, y = 41},
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
return { name = {"Jokers"}, items = {rando} }