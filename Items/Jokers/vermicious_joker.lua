local vermicious_joker = {
    object_type = "Joker",
    order = 772,
    ignore = true,

    key = "vermicious_joker",
    config = {

    },
    rarity = 1,
    pos = { x = 9, y = 41},
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
return { name = {"Jokers"}, items = {vermicious_joker} }