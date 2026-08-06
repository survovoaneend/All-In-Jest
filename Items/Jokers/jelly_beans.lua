local jelly_beans = {
    object_type = "Joker",
    order = 982,
    ignore = true,

    key = "jelly_beans",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 5, y = 46},
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
return { name = {"Jokers"}, items = {jelly_beans} }