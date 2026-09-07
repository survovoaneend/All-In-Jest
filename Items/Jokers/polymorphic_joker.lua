local polymorphic_joker = {
    object_type = "Joker",
    order = 963,
    ignore = true,

    key = "polymorphic_joker",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 12, y = 44},
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
return { name = {"Jokers"}, items = {polymorphic_joker} }