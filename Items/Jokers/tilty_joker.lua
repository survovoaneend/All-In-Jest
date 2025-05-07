local tilty_joker = {
    object_type = "Joker",
    order = 273,
    ignore = true,
    key = "tilty_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 21, y = 10},
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
return { name = {"Jokers"}, items = {tilty_joker} }
