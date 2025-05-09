local curse_of_scotland = {
    object_type = "Joker",
    order = 243,
    ignore = true,
    key = "curse_of_scotland",
    config = {
      
    },
    rarity = 1,
    pos = { x = 10, y = 9},
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
return { name = {"Jokers"}, items = {curse_of_scotland} }
