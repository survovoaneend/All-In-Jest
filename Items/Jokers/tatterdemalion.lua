local tatterdemalion = {
    object_type = "Joker",
    order = 678,
    ignore = true,

    key = "tatterdemalion",
    config = {

    },
    rarity = 1,
    pos = { x = 18, y = 37},
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
return { name = {"Jokers"}, items = {tatterdemalion} }