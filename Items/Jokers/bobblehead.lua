local bobblehead = {
    object_type = "Joker",
    order = 78,
    ignore = true,

    key = "bobblehead",
    config = {
      
    },
    rarity = 1,
    pos = { x = 23, y = 2 },
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
return { name = {"Jokers"}, items = {bobblehead} }
