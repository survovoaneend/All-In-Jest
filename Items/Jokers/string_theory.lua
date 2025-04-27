local string_theory = {
    object_type = "Joker",
    order = 94,
    ignore = true,

    key = "string_theory",
    config = {
      
    },
    rarity = 1,
    pos = { x = 14, y = 3 },
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
return { name = {"Jokers"}, items = {string_theory} }
