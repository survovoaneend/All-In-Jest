local flora = {
    object_type = "Joker",
    order = 703,
    ignore = true,

    key = "flora",
    config = {

    },
    rarity = 1,
    pos = { x = 18, y = 38},
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
return { name = {"Jokers"}, items = {flora} }