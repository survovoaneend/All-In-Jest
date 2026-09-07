local force_the_hand_of_fate = {
    object_type = "Joker",
    order = 971,
    ignore = true,

    key = "force_the_hand_of_fate",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 20, y = 44},
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
return { name = {"Jokers"}, items = {force_the_hand_of_fate} }