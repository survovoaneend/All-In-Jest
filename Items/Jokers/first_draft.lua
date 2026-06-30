local first_draft = {
    object_type = "Joker",
    order = 755,
    ignore = true,

    key = "first_draft",
    config = {

    },
    rarity = 1,
    pos = { x = 17, y = 40},
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
return { name = {"Jokers"}, items = {first_draft} }