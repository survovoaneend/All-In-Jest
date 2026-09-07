local revolving_jubilation = {
    object_type = "Joker",
    order = 882,
    ignore = true,

    key = "revolving_jubilation",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 3, y = 41},
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
return { name = {"Jokers"}, items = {revolving_jubilation} }