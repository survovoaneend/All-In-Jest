local info_joker_start = {
    object_type = "Joker",
    order = 736,
    ignore = true,

    key = "info_joker_start",
    config = {

    },
    rarity = 1,
    pos = { x = 1, y = 40},
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
return { name = {"Jokers"}, items = {info_joker_start} }