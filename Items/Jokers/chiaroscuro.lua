local chiaroscuro = {
    object_type = "Joker",
    order = 759,
    ignore = true,

    key = "chiaroscuro",
    config = {

    },
    rarity = 1,
    pos = { x = 21, y = 40},
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
return { name = {"Jokers"}, items = {chiaroscuro} }