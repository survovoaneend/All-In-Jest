local tin_man = {
    object_type = "Joker",
    order = 528,
    key = "tin_man",
    ignore = true,
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 13, y = 25 },
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

return { name = { "Jokers" }, items = { tin_man } }
