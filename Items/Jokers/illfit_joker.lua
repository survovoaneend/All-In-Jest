local illfit_joker = {
    object_type = "Joker",
    order = 719,
    ignore = true,

    key = "illfit_joker",
    config = {

    },
    rarity = 1,
    pos = { x = 9, y = 39},
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
return { name = {"Jokers"}, items = {illfit_joker} }