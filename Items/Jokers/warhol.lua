local warhol = {
    object_type = "Joker",
    order = 240,
    ignore = true,
    key = "warhol",
    config = {
      
    },
    rarity = 1,
    pos = { x = 8, y = 9},
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
return { name = {"Jokers"}, items = {warhol} }
