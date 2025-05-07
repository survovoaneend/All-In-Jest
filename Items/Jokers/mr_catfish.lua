local mr_catfish = {
    object_type = "Joker",
    order = 282,
    ignore = true,
    key = "mr_catfish",
    config = {
      
    },
    rarity = 1,
    pos = { x = 5, y = 11},
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
return { name = {"Jokers"}, items = {mr_catfish} }
