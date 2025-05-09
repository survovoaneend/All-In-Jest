local theyre_laughing_at_you = {
    object_type = "Joker",
    order = 257,
    ignore = true,
    key = "theyre_laughing_at_you",
    config = {
      
    },
    rarity = 1,
    pos = { x = 4, y = 10},
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
return { name = {"Jokers"}, items = {theyre_laughing_at_you} }
