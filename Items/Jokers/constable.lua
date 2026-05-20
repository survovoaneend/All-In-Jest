local constable = {
    object_type = "Joker",
    order = 650,
    ignore = true,

    key = "constable",
    config = {

    },
    rarity = 1,
    pos = { x = 17, y = 30},
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
return { name = {"Jokers"}, items = {constable} }