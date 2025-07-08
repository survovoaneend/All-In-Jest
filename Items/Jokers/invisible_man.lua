
local invisible_man = {
    object_type = "Joker",
    order = 6,
    ignore = true,
    key = "invisible_man",
    config = {
      
    },
    rarity = 3,
    pos = { x = 4, y = 0 },
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

return { name = {"Jokers"}, items = {invisible_man} }
