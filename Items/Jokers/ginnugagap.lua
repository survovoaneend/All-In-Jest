local ginnugagap = {
    object_type = "Joker",
    order = 734,
    ignore = true,

    key = "ginnugagap",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 2, y = 39},
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
return { name = {"Jokers"}, items = {ginnugagap} }