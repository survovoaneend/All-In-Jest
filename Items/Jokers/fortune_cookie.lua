local fortune_cookie = {
    object_type = "Joker",
    order = 272,
    ignore = true,
    key = "fortune_cookie",
    config = {
      
    },
    rarity = 1,
    pos = { x = 20, y = 10},
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
return { name = {"Jokers"}, items = {fortune_cookie} }
