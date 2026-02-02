local richie_rich = {
    object_type = "Joker",
    order = 237,
    
    key = "richie_rich",
    config = {
      
    },
    rarity = 1,
    pos = { x = 5, y = 9},
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
return { name = {"Jokers"}, items = {richie_rich} }
