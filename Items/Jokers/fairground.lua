local fairground = {
    object_type = "Joker",
    order = 709,
    ignore = true,

    key = "fairground",
    config = {

    },
    rarity = 1,
    pos = { x = 24, y = 38},
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
return { name = {"Jokers"}, items = {fairground} }