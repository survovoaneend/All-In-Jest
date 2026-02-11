local clipart = {
    object_type = "Joker",
    order = 592,
    key = "bon_vivant",
  
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 5, y = 28 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
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


return { name = { "Jokers" }, items = { clipart } }