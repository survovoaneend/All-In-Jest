local hacking_minigame = {
    object_type = "Joker",
    order = 845,
    ignore = true,

    key = "hacking_minigame",
    config = {

    },
    attributes = {},
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
return { name = {"Jokers"}, items = {hacking_minigame} }