local geoglyph = {
    object_type = "Joker",
    order = 427,
    key = "geoglyph",
    
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 7, y = 20 },
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

return { name = { "Jokers" }, items = { geoglyph } }
