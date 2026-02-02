local disco_joker = {
    object_type = "Joker",
    order = 548,
    key = "disco_joker",
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 6, y = 26 },
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

return { name = { "Jokers" }, items = { disco_joker } }
