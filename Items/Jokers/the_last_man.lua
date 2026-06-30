local the_last_man = {
    object_type = "Joker",
    order = 664,
    ignore = true,

    key = "the_last_man",
    config = {

    },
    rarity = 1,
    pos = { x = 4, y = 37},
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
return { name = {"Jokers"}, items = {the_last_man} }