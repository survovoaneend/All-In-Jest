local ochre_joker = {
    object_type = "Joker",
    order = 738,
    ignore = true,

    key = "ochre_joker",
    config = {

    },
    rarity = 1,
    pos = { x = 3, y = 40},
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
return { name = {"Jokers"}, items = {ochre_joker} }