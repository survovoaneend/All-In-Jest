local bell = {
    object_type = "Joker",
    order = 1078,
    ignore = true,
    key = "bell",
    config = {
       
    },
    attributes = {},
    rarity = 4,
    pos = { x = 4, y = 14 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 4, y = 15 },

    loc_vars = function(self, info_queue, card)
        
    end,

    calculate = function(self, card, context)
        
    end,
}
return { name = { "Jokers" }, items = { bell } }