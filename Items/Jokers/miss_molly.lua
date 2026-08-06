local miss_molly = {
    object_type = "Joker",
    order = 803,
    ignore = true,

    key = "miss_molly",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 16, y = 41},
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
return { name = {"Jokers"}, items = {miss_molly} }