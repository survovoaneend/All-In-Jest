local loveabjuring_band = {
    object_type = "Joker",
    order = 976,
    ignore = true,

    key = "loveabjuring_band",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 0, y = 45},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { }
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {loveabjuring_band} }