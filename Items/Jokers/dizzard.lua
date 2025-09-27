local dizzard = {
  object_type = "Joker",
  order = 161,

  key = "dizzard",
  config = {
    
  },
  rarity = 3,
  pos = { x = 5, y = 6},
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
return { name = {"Jokers"}, items = {dizzard} }
