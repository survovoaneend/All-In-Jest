local tar_joker = {
    object_type = "Joker",
    order = 660,
    key = "tar_joker",
    ignore = true,
    config = {
        extra = {
            
        }
    },
    attributes = {},
    rarity = 1,
    pos = { x = 17, y = 29 },
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
return { name = {"Jokers"}, items = {tar_joker} }
