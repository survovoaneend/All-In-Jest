local anchor = {
    object_type = "Joker",
    order = 59,
    key = "anchor",
    config = {
      
    },
    rarity = 2,
    pos = { x = 5, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {anchor} }
