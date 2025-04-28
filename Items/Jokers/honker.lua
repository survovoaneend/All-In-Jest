local honker = {
    object_type = "Joker",
    order = 134,
    ignore = true,

    key = "honker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 3, y = 5 },
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
return { name = {"Jokers"}, items = {honker} }
