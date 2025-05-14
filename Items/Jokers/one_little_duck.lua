local one_little_duck = {
    object_type = "Joker",
    order = 266,
    ignore = true,
    key = "one_little_duck",
    config = {
      
    },
    rarity = 1,
    pos = { x = 13, y = 10},
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
return { name = {"Jokers"}, items = {one_little_duck} }
