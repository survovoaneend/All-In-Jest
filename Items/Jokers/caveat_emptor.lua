local caveat_emptor = {
    object_type = "Joker",
    order = 950,
    ignore = true,

    key = "caveat_emptor",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 1, y = 45},
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
return { name = {"Jokers"}, items = {caveat_emptor} }