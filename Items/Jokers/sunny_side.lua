local sunny_side = {
    object_type = "Joker",
    order = 255,
    ignore = true,
    key = "sunny_side",
    config = {
      
    },
    rarity = 1,
    pos = { x = 2, y = 10},
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
return { name = {"Jokers"}, items = {sunny_side} }
