local poetry = {
    object_type = "Joker",
    order = 764,
    ignore = true,

    key = "poetry",
    config = {

    },
    rarity = 1,
    pos = { x = 1, y = 41},
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
return { name = {"Jokers"}, items = {poetry} }