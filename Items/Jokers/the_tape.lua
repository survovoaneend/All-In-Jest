local the_tape = {
    object_type = "Joker",
    order = 967,
    ignore = true,

    key = "the_tape",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 16, y = 44},
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
return { name = {"Jokers"}, items = {the_tape} }