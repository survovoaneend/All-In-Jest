local totally_nuts = {
    object_type = "Joker",
    order = 239,
    ignore = true,
    key = "totally_nuts",
    config = {
      
    },
    rarity = 1,
    pos = { x = 7, y = 9},
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
return { name = {"Jokers"}, items = {totally_nuts} }
