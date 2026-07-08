local ghost_joker = {
    object_type = "Joker",
    order = 723,
    ignore = true,

    key = "ghost_joker",
    config = {

    },
    rarity = 1,
    pos = { x = 13, y = 39},
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
return { name = {"Jokers"}, items = {ghost_joker} }