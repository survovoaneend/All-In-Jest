local shredded_joker = {
    object_type = "Joker",
    order = 506,
    key = "shredded_joker",
    
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 16, y = 24 },
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

return { name = { "Jokers" }, items = { shredded_joker } }
