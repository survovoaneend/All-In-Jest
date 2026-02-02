local beelzebub = {
    object_type = "Joker",
    order = 481,
    key = "beelzebub",
    
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 22, y = 23 },
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

return { name = { "Jokers" }, items = { beelzebub } }
