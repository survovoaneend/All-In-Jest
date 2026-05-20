local masquerade = {
    object_type = "Joker",
    order = 628,
    ignore = true,

    key = "masquerade",
    config = {

    },
    rarity = 1,
    pos = { x = 20, y = 29},
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
return { name = {"Jokers"}, items = {masquerade} }