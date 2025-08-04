local platinum_chip = {
    object_type = "Joker",
    order = 35,
    ignore = true,

    key = "platinum_chip",
    config = {
      
    },
    rarity = 1,
    pos = { x = 8, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {platinum_chip} }
