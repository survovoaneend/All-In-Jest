local scanlines = {
    object_type = "Joker",
    order = 641,
    ignore = true,

    key = "scanlines",
    config = {

    },
    rarity = 1,
    pos = { x = 8, y = 30},
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
return { name = {"Jokers"}, items = {scanlines} }