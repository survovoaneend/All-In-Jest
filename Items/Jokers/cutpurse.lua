local cutpurse = {
    object_type = "Joker",
    order = 727,
    ignore = true,

    key = "cutpurse",
    config = {

    },
    rarity = 1,
    pos = { x = 17, y = 39},
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
return { name = {"Jokers"}, items = {cutpurse} }