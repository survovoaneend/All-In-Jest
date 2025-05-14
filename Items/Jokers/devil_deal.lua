local devil_deal = {
    object_type = "Joker",
    order = 238,
    ignore = true,
    key = "devil_deal",
    config = {
      
    },
    rarity = 1,
    pos = { x = 6, y = 9},
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
return { name = {"Jokers"}, items = {devil_deal} }
