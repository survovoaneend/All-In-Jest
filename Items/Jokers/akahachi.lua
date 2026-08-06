local akahachi = {
    object_type = "Joker",
    order = 648,
    key = "akahachi",
    ignore = true,
    config = {
        extra = {
            
        }
    },
    attributes = {},
    rarity = 1,
    pos = { x = 5, y = 29 },
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
return { name = {"Jokers"}, items = {akahachi} }
