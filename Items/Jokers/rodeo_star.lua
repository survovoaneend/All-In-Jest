local rodeo_star = {
    object_type = "Joker",
    order = 924,
    ignore = true,

    key = "rodeo_star",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 23, y = 42},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { }
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {rodeo_star} }