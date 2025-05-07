local stock_broker = {
    object_type = "Joker",
    order = 253,
    ignore = true,
    key = "stock_broker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 0, y = 10},
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
return { name = {"Jokers"}, items = {stock_broker} }
