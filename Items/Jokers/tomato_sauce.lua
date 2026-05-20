local tomato_sauce = {
    object_type = "Joker",
    order = 629,
    ignore = true,

    key = "tomato_sauce",
    config = {

    },
    rarity = 1,
    pos = { x = 21, y = 29},
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
return { name = {"Jokers"}, items = {tomato_sauce} }