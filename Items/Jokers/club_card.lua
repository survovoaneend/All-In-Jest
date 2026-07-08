local club_card = {
    object_type = "Joker",
    order = 785,
    ignore = true,

    key = "club_card",
    config = {

    },
    rarity = 1,
    pos = { x = 20, y = 41},
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
return { name = {"Jokers"}, items = {club_card} }