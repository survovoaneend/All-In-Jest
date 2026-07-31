local comic_spirit = {
    object_type = "Joker",
    order = 948,
    ignore = true,

    key = "comic_spirit",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 24, y = 44},
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
return { name = {"Jokers"}, items = {comic_spirit} }