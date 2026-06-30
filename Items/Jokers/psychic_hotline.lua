local psychic_hotline = {
    object_type = "Joker",
    order = 788,
    ignore = true,

    key = "psychic_hotline",
    config = {

    },
    rarity = 1,
    pos = { x = 23, y = 41},
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
return { name = {"Jokers"}, items = {psychic_hotline} }