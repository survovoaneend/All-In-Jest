local fabulist = {
    object_type = "Joker",
    order = 826,
    ignore = true,

    key = "fabulist",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 0, y = 39},
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
return { name = {"Jokers"}, items = {fabulist} }