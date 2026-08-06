local sticker_sheet_needs_renamed = {
    object_type = "Joker",
    order = 835,
    ignore = true,

    key = "sticker_sheet_needs_renamed",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 8, y = 39},
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
return { name = {"Jokers"}, items = {sticker_sheet_needs_renamed} }