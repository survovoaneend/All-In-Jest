local event_horizon = {
  object_type = "Joker",
  order = 169,
   ignore = true,
  key = "event_horizon",
  config = {
    
  },
  rarity = 3,
  pos = { x = 13, y = 6},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  add_to_deck = function(self, card, from_debuff)
    
  end,

  remove_from_deck = function(self, card, from_debuff)
      
  end,
}
return { name = {"Jokers"}, items = {event_horizon} }
