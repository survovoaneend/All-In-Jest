local pedestrian = {
    object_type = "Joker",
    order = 372,
    key = "pedestrian",
    
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 24, y = 16 },
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

return { name = { "Jokers" }, items = { pedestrian } }
