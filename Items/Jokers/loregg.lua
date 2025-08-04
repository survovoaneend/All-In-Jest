local loregg = {
    object_type = "Joker",
    order = 224,
    ignore = true,

    key = "loregg",
    config = {
      
    },
    rarity = 1,
    pos = { x = 13, y = 8},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {loregg} }
