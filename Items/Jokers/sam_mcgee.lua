local sam_mcgee = {
    object_type = "Joker",
    order = 469,
    key = "sam_mcgee",
    
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 11, y = 23 },
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

return { name = { "Jokers" }, items = { sam_mcgee } }
