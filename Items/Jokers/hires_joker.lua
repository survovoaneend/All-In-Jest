local hires_joker = {
    object_type = "Joker",
    order = 6.5,
    ignore = true,
    key = "hires_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 0, y = 0},
    atlas = 'hires_joker',
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
return { name = {"Jokers"}, items = {hires_joker} }
