local corny_joker = {
    object_type = "Joker",
    order = 250,
    ignore = true,
    key = "corny_joker",
    config = {
      
    },
    attributes = {},
    rarity = 1,
    pos = { x = 12, y = 9},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {corny_joker} }
