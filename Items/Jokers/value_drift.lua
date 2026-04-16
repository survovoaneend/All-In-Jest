local value_drift = {
    object_type = "Joker",
    order = 627,
    ignore = true,

    key = "value_drift",
    config = {

    },
    rarity = 1,
    pos = { x = 19, y = 29},
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
return { name = {"Jokers"}, items = {value_drift} }