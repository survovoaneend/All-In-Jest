local mariachi = {
    object_type = "Joker",
    order = 632,
    ignore = true,

    key = "mariachi",
    config = {

    },
    rarity = 1,
    pos = { x = 24, y = 29},
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
return { name = {"Jokers"}, items = {mariachi} }