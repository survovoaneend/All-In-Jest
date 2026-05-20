local third_degree = {
    object_type = "Joker",
    order = 633,
    ignore = true,

    key = "third_degree",
    config = {

    },
    rarity = 1,
    pos = { x = 0, y = 30},
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
return { name = {"Jokers"}, items = {third_degree} }