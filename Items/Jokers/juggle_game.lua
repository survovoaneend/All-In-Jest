local juggle_game = {
    object_type = "Joker",
    order = 964,
    ignore = true,

    key = "juggle_game",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 13, y = 44},
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
return { name = {"Jokers"}, items = {juggle_game} }