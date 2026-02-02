local neptunium = {
    object_type = "Joker",
    order = 565,
    key = "neptunium",
    
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 3, y = 27 },
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

return { name = { "Jokers" }, items = { neptunium } }
