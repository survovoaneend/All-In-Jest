local beekeeper = {
    object_type = "Joker",
    order = 911,
    ignore = true,

    key = "beekeeper",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 7, y = 42},
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
return { name = {"Jokers"}, items = {beekeeper} }