local banana_for_scale = {
    object_type = "Joker",
    order = 704,
    ignore = true,

    key = "banana_for_scale",
    config = {

    },
    rarity = 1,
    pos = { x = 19, y = 38},
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
return { name = {"Jokers"}, items = {banana_for_scale} }