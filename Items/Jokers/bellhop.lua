local bellhop = {
    object_type = "Joker",
    order = 750,
    ignore = true,

    key = "bellhop",
    config = {

    },
    rarity = 1,
    pos = { x = 12, y = 40},
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
return { name = {"Jokers"}, items = {bellhop} }