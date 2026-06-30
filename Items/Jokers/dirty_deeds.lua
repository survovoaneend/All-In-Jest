local dirty_deeds = {
    object_type = "Joker",
    order = 670,
    ignore = true,

    key = "dirty_deeds",
    config = {

    },
    rarity = 1,
    pos = { x = 10, y = 37},
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
return { name = {"Jokers"}, items = {dirty_deeds} }