local autograph = {
    object_type = "Joker",
    order = 930,
    ignore = true,

    key = "autograph",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 4, y = 43},
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
return { name = {"Jokers"}, items = {autograph} }