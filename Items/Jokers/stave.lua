local stave = {
    object_type = "Joker",
    order = 254,
    
    key = "stave",
    config = {
      
    },
    rarity = 1,
    pos = { x = 1, y = 10},
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
return { name = {"Jokers"}, items = {stave} }
