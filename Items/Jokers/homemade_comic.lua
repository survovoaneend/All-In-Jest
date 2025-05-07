local homemade_comic = {
    object_type = "Joker",
    order = 298,
    ignore = true,
    key = "homemade_comic",
    config = {
      
    },
    rarity = 1,
    pos = { x = 20, y = 11},
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
return { name = {"Jokers"}, items = {homemade_comic} }
