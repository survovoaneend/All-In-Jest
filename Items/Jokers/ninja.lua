local ninja = {
    object_type = "Joker",
    order = 420,
    key = "ninja",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 20, y = 20 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        
    end
}

return { name = { "Jokers" }, items = { ninja } }
