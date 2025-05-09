local funny_phone = {
    object_type = "Joker",
    order = 261,
    ignore = true,
    key = "funny_phone",
    config = {
      
    },
    rarity = 1,
    pos = { x = 8, y = 10},
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
return { name = {"Jokers"}, items = {funny_phone} }
