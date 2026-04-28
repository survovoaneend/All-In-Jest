local the_living_god = {
    object_type = "Joker",
    order = 642,
    ignore = true,

    key = "the_living_god",
    config = {

    },
    rarity = 1,
    pos = { x = 9, y = 30},
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
return { name = {"Jokers"}, items = {the_living_god} }