local doctors_orders = {
    object_type = "Joker",
    order = 284,
    ignore = true,
    key = "doctors_orders",
    config = {
      
    },
    rarity = 1,
    pos = { x = 7, y = 11},
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
return { name = {"Jokers"}, items = {doctors_orders} }
