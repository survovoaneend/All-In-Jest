local my_beautiful_balloon = {
    object_type = "Joker",
    order = 683,
    ignore = true,

    key = "my_beautiful_balloon",
    config = {

    },
    rarity = 1,
    pos = { x = 23, y = 37},
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
return { name = {"Jokers"}, items = {my_beautiful_balloon} }