local corporate_memphis = {
    object_type = "Joker",
    order = 927,
    ignore = true,

    key = "corporate_memphis",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 1, y = 43},
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
return { name = {"Jokers"}, items = {corporate_memphis} }