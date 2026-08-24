local great_pretender = {
    object_type = "Joker",
    order = 727,
    ignore = true,

    key = "great_pretender",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 20, y = 38},
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
return { name = {"Jokers"}, items = {great_pretender} }