local per_aspera_ad_astra = {
    object_type = "Joker",
    order = 980,
    ignore = true,

    key = "per_aspera_ad_astra",
    config = {

    },
    attributes = {},
    rarity = 1,
    pos = { x = 4, y = 45},
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
return { name = {"Jokers"}, items = {per_aspera_ad_astra} }