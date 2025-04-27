local furbo_e_stupedo = {
    object_type = "Joker",
    order = 91,
    ignore = true,

    key = "furbo_e_stupendo",
    config = {
      
    },
    rarity = 1,
    pos = { x = 11, y = 3 },
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
return { name = {"Jokers"}, items = {furbo_e_stupedo} }
