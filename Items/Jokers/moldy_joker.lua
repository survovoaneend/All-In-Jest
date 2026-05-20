local moldy_joker = {
    object_type = "Joker",
    order = 643,
    ignore = true,

    key = "moldy_joker",
    config = {

    },
    rarity = 1,
    pos = { x = 10, y = 30},
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
return { name = {"Jokers"}, items = {moldy_joker} }