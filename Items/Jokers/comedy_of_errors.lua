local comedy_of_errors = {
    object_type = "Joker",
    order = 258,
    ignore = true,
    key = "comedy_of_errors",
    config = {
      
    },
    rarity = 1,
    pos = { x = 5, y = 10},
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
return { name = {"Jokers"}, items = {comedy_of_errors} }
