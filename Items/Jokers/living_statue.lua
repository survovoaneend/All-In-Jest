local living_statue = {
    object_type = "Joker",
    order = 861,
    ignore = true,

    key = "living_statue",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 8, y = 40},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { }
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {living_statue} }