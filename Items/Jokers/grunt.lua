local grunt = {
    object_type = "Joker",
    order = 743,
    ignore = true,

    key = "grunt",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 11, y = 39},
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
return { name = {"Jokers"}, items = {grunt} }