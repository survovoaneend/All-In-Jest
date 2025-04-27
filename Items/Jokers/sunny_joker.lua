local sunny_joker = {
    object_type = "Joker",
    order = 103,
    ignore = true,

    key = "sunny_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 23, y = 3 },
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
return { name = {"Jokers"}, items = {sunny_joker} }
