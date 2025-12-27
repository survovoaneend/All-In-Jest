local treasure_map = {
    object_type = "Joker",
    order = 426,
    key = "treasure_map",
    ignore = true,
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 1, y = 21 },
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

return { name = { "Jokers" }, items = { treasure_map } }
