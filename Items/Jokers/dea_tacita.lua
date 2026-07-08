local dea_tacita = {
    object_type = "Joker",
    order = 673,
    ignore = true,

    key = "dea_tacita",
    config = {

    },
    rarity = 1,
    pos = { x = 13, y = 37},
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
return { name = {"Jokers"}, items = {dea_tacita} }