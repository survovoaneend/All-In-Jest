local strange_situation = {
    object_type = "Joker",
    order = 761,
    ignore = true,

    key = "strange_situation",
    config = {

    },
    rarity = 1,
    pos = { x = 23, y = 40},
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
return { name = {"Jokers"}, items = {strange_situation} }