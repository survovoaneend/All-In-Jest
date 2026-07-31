local stereoscopic_joker = {
    object_type = "Joker",
    order = 835,
    ignore = true,

    key = "stereoscopic_joker",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 9, y = 40},
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
return { name = {"Jokers"}, items = {stereoscopic_joker} }