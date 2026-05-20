local dirty_deed = {
    object_type = "Joker",
    order = 657,
    ignore = true,

    key = "dirty_deed",
    config = {

    },
    rarity = 1,
    pos = { x = 22, y = 30},
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
return { name = {"Jokers"}, items = {dirty_deed} }