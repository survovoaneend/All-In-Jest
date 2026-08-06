local skywriting = {
    object_type = "Joker",
    order = 923,
    ignore = true,

    key = "skywriting",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 22, y = 42},
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
return { name = {"Jokers"}, items = {skywriting} }