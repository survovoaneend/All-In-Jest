local de_morra = {
    object_type = "Joker",
    order = 10002,
    ignore = true,

    key = "de_morra",
    config = {
        extra = {
        
        }
    },
    attributes = {},
    rarity = 4,
    -- unlock_condition = { hidden = true },
    pos = { x = 5, y = 14},
    atlas = legendary_atlas,
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- soul_pos = { x = 5, y = 15},

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
            
            }
        }
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {de_morra} }