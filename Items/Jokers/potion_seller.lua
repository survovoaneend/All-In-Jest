local potion_seller = {
    object_type = "Joker",
    order = 751,
    ignore = true,

    key = "potion_seller",
    config = {

    },
    rarity = 1,
    pos = { x = 13, y = 40},
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
return { name = {"Jokers"}, items = {potion_seller} }