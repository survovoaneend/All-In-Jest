local froggy_joker = {
    object_type = "Joker",
    order = 778,
    ignore = true,

    key = "froggy_joker",
    config = {

    },
    rarity = 1,
    pos = { x = 13, y = 41},
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
return { name = {"Jokers"}, items = {froggy_joker} }