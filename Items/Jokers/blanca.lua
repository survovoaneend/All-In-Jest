local blanca = {
    object_type = "Joker",
    order = 864,
    ignore = true,

    key = "blanca",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 11, y = 40},
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
return { name = {"Jokers"}, items = {blanca} }