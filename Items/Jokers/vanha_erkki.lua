local vanha_erkki = {
    object_type = "Joker",
    order = 677,
    ignore = true,

    key = "vanha_erkki",
    config = {

    },
    rarity = 1,
    pos = { x = 17, y = 37},
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
return { name = {"Jokers"}, items = {vanha_erkki} }