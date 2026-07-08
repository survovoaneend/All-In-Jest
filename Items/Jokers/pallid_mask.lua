local pallid_mask = {
    object_type = "Joker",
    order = 716,
    ignore = true,

    key = "pallid_mask",
    config = {

    },
    rarity = 1,
    pos = { x = 6, y = 39},
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
return { name = {"Jokers"}, items = {pallid_mask} }