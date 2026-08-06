local esther = {
    object_type = "Joker",
    order = 890,
    ignore = true,

    key = "esther",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 11, y = 41},
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
return { name = {"Jokers"}, items = {esther} }