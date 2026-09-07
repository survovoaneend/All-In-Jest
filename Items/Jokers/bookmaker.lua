local bookmaker = {
    object_type = "Joker",
    order = 880,
    ignore = true,

    key = "bookmaker",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 1, y = 41},
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
return { name = {"Jokers"}, items = {bookmaker} }