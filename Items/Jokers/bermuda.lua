local bermuda = {
    object_type = "Joker",
    order = 503,
    key = "bermuda",
    ignore = true,
    config = {
        extra = {
            
        }
    },
    attributes = {},
    rarity = 1,
    pos = { x = 0, y = 24 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        
    end
}

return { name = { "Jokers" }, items = { bermuda } }
