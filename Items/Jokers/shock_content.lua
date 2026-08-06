local shock_content = {
    object_type = "Joker",
    order = 970,
    ignore = true,

    key = "shock_content",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 17, y = 45},
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
return { name = {"Jokers"}, items = {shock_content} }