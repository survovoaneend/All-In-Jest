local unfalisifiable_ceramics = {
    object_type = "Joker",
    order = 748,
    ignore = true,

    key = "unfalisifiable_ceramics",
    config = {

    },
    rarity = 1,
    pos = { x = 10, y = 40},
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
return { name = {"Jokers"}, items = {unfalisifiable_ceramics} }