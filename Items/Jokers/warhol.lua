local warhol = {
    object_type = "Joker",
    order = 240,
    key = "warhol",
    config = {
      
    },
    rarity = 3,
    pos = { x = 8, y = 9},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {warhol} }
