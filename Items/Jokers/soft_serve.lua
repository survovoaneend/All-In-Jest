local soft_serve = {
    object_type = "Joker",
    order = 522,
    key = "soft_serve",
    ignore = true,
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 7, y = 25 },
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

return { name = { "Jokers" }, items = { soft_serve } }
