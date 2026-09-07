local platinum_chip = {
    object_type = "Joker",
    order = 38,
    ignore = true,

    key = "platinum_chip",
    config = {
      
    },
    attributes = {},
    rarity = 1,
    pos = { x = 8, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {platinum_chip} }
