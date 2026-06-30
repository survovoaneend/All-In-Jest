local petri_dish = {
    object_type = "Joker",
    order = 787,
    ignore = true,

    key = "petri_dish",
    config = {

    },
    rarity = 1,
    pos = { x = 22, y = 41},
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
return { name = {"Jokers"}, items = {petri_dish} }