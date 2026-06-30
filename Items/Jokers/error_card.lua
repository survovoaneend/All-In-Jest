local error_card = {
    object_type = "Joker",
    order = 733,
    ignore = true,

    key = "error_card",
    config = {

    },
    rarity = 1,
    pos = { x = 23, y = 39},
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
return { name = {"Jokers"}, items = {error_card} }