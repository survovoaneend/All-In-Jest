local average_joe = {
    object_type = "Joker",
    order = 150,
    ignore = true,
    key = "average_joe",
    config = {
      
    },
    rarity = 1,
    pos = { x = 19, y = 5 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        balance_percent(card,0.2)
      end
    end
  
}
return { name = {"Jokers"}, items = {average_joe} }
