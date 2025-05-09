local opening_move = {
    object_type = "Joker",
    order = 274,
    ignore = true,
    key = "opening_move",
    config = {
      
    },
    rarity = 1,
    pos = { x = 22, y = 10},
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
return { name = {"Jokers"}, items = {opening_move} }
