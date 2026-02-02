local bowls_of_joy = {
    object_type = "Joker",
    order = 296,
   
    key = "bowls_of_joy",
    config = {
      
    },
    rarity = 1,
    pos = { x = 18, y = 11},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {bowls_of_joy} }
