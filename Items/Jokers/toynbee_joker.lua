local toynbee_joker = {
    object_type = "Joker",
    order = 217,
    ignore = true,

    key = "toynbee_joker",
    config = {
      
    },
    rarity = 2,
    pos = { x = 6, y = 8},
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
return { name = {"Jokers"}, items = {toynbee_joker} }
