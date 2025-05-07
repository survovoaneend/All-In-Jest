local blue_eyes_white_joker = {
    object_type = "Joker",
    order = 285,
    ignore = true,
    key = "blue_eyes_white_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 8, y = 11},
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
return { name = {"Jokers"}, items = {blue_eyes_white_joker} }
