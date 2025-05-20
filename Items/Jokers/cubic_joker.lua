local cubic_joker = {
    object_type = "Joker",
    order = 334,
    ignore = true,
    key = "cubic_joker",
    config = {
    },
    rarity = 1,
    pos = { x = 4, y = 13},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {cubic_joker} }
