local whiskey_shot = {
    object_type = "Joker",
    order = 857,
    ignore = true,

    key = "whiskey_shot",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 4, y = 40},
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
return { name = {"Jokers"}, items = {whiskey_shot} }