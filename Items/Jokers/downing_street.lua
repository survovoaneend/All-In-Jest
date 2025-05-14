local downing_street = {
    object_type = "Joker",
    order = 265,
    ignore = true,
    key = "downing_street",
    config = {
      
    },
    rarity = 1,
    pos = { x = 12, y = 10},
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
return { name = {"Jokers"}, items = {downing_street} }
