local antonio = {
    object_type = "Joker",
    order = 10004,
    ignore = true,

    key = "antonio",
    config = {
        extra = {
        
        }
    },
    attributes = {},
    rarity = 4,
    -- unlock_condition = { hidden = true },
    pos = { x = 7, y = 14},
    atlas = legendary_atlas,
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    -- soul_pos = { x = 7, y = 15},

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
            
            }
        }
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {antonio} }