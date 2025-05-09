local four_leaf_clover = {
    object_type = "Joker",
    order = 267,
    ignore = true,
    key = "four_leaf_clover",
    config = {
      
    },
    rarity = 1,
    pos = { x = 14, y = 10},
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
return { name = {"Jokers"}, items = {four_leaf_clover} }
