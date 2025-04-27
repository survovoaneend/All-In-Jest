local ijoker_co = {
    object_type = "Joker",
    order = 211,
    ignore = true,

    key = "ijoker_co",
    config = {
      
    },
    rarity = 1,
    pos = { x = 0, y = 8},
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
return { name = {"Jokers"}, items = {ijoker_co} }
