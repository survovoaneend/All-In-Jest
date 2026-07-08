local ribbon = {
    object_type = "Joker",
    order = 757,
    ignore = true,

    key = "ribbon",
    config = {

    },
    rarity = 1,
    pos = { x = 19, y = 40},
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
return { name = {"Jokers"}, items = {ribbon} }