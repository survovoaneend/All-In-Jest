local honest_john = {
  object_type = "Joker",
  order = 160,
  ignore = true,

  key = "honest_john",
  config = {
    
  },
  rarity = 1,
  pos = { x = 4, y = 6},
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
return { name = {"Jokers"}, items = {honest_john} }
