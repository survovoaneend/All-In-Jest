local bartender = {
    object_type = "Joker",
    order = 275,
    ignore = true,
    key = "bartender",
    config = {
      
    },
    rarity = 1,
    pos = { x = 23, y = 10},
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
return { name = {"Jokers"}, items = {bartender} }
