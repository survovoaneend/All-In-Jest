local blanche = {
    object_type = "Joker",
    order = 1069,
    ignore = true,
    key = "blanche",
    config = {
       
    },
    rarity = 4,
    pos = { x = 6, y = 12 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 6, y = 13 },

    loc_vars = function(self, info_queue, card)
        
    end,

    calculate = function(self, card, context)
        
    end,
}
return { name = { "Jokers" }, items = { blanche } }