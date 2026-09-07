local de_acedo = {
    object_type = "Joker",
    order = 10003,
    ignore = true,

    key = "de_acedo",
    config = {
        extra = {
        
        }
    },
    attributes = {},
    rarity = 4,
    -- unlock_condition = { hidden = true },
    pos = { x = 6, y = 14},
    atlas = legendary_atlas,
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- soul_pos = { x = 6, y = 15},

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
            
            }
        }
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {de_acedo} }