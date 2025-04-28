local toothy_joker = {
    object_type = "Joker",
    order = 213,
    ignore = true,

    key = "toothy_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 2, y = 8},
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
return { name = {"Jokers"}, items = {toothy_joker} }
