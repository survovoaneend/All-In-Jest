local cap_n_bells = {
    object_type = "Joker",
    order = 910,
    ignore = true,

    key = "cap_n_bells",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 6, y = 42},
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
return { name = {"Jokers"}, items = {cap_n_bells} }