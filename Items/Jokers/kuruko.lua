local kuruko = {
    object_type = "Joker",
    order = 303,
    
    key = "kuruko",
    config = {
      
    },
    rarity = 1,
    pos = { x = 0, y = 12},
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
return { name = {"Jokers"}, items = {kuruko} }
