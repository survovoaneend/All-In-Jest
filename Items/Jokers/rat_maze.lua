local rat_maze = {
    object_type = "Joker",
    order = 377,
    key = "rat_maze",
    
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 12, y = 16 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        
    end
}

return { name = { "Jokers" }, items = { rat_maze } }
