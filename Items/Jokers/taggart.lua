local taggart = {
    object_type = "Joker",
    order = 262,
    
    key = "taggart",
    config = {
      
    },
    rarity = 3,
    pos = { x = 10, y = 10},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {taggart} }
