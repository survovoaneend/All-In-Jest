local a_v_g_m = {
    object_type = "Joker",
    order = 630,
    ignore = true,

    key = "a_v_g_m",
    config = {

    },
    rarity = 1,
    pos = { x = 22, y = 29},
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
return { name = {"Jokers"}, items = {a_v_g_m} }