local two_spooky_four_me = {
    object_type = "Joker",
    order = 956,
    ignore = true,

    key = "two_spooky_four_me",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 5, y = 44},
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
return { name = {"Jokers"}, items = {two_spooky_four_me} }