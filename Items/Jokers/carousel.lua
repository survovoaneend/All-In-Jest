local carousel = {
    object_type = "Joker",
    order = 23,
    ignore = true,

    key = "carousel",
    config = {
      
    },
    rarity = 1,
    pos = { x = 21, y = 0 },
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
return { name = {"Jokers"}, items = {carousel} }
