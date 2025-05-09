local heavy_sixer = {
    object_type = "Joker",
    order = 280,
    ignore = true,
    key = "heavy_sixer",
    config = {
      
    },
    rarity = 1,
    pos = { x = 3, y = 11},
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
return { name = {"Jokers"}, items = {heavy_sixer} }
