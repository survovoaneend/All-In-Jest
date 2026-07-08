local lich = {
    object_type = "Joker",
    order = 696,
    ignore = true,

    key = "lich",
    config = {

    },
    rarity = 1,
    pos = { x = 11, y = 38},
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
return { name = {"Jokers"}, items = {lich} }