local candy_floss = {
    object_type = "Joker",
    order = 304,
    ignore = true,
    key = "candy_floss",
    config = {
      
    },
    rarity = 1,
    pos = { x = 1, y = 12},
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
return { name = {"Jokers"}, items = {candy_floss} }
