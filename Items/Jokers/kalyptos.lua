local kalyptos = {
    object_type = "Joker",
    order = 744,
    ignore = true,

    key = "kalyptos",
    config = {

    },
    rarity = 1,
    pos = { x = 6, y = 40},
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
return { name = {"Jokers"}, items = {kalyptos} }