local oklo_reactor = {
    object_type = "Joker",
    order = 549,
    key = "oklo_reactor",
    
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 3, y = 22 },
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

return { name = { "Jokers" }, items = { oklo_reactor } }
