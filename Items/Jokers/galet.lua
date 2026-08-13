local galet = {
    object_type = "Joker",
    order = 10008,
    ignore = true,

    key = "galet",
    config = {
        extra = {
        
        }
    },
    attributes = {},
    rarity = 4,
    -- unlock_condition = { hidden = true },
    pos = { x = 0, y = 16},
    atlas = legendary_atlas,
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    -- soul_pos = { x = 0, y = 17},

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
            
            }
        }
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {galet} }