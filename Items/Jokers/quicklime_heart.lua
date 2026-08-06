local quicklime_heart = {
    object_type = "Joker",
    order = 888,
    ignore = true,

    key = "quicklime_heart",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 9, y = 41},
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
return { name = {"Jokers"}, items = {quicklime_heart} }