local ultrasound = {
  object_type = "Joker",
  order = 19,
  ignore = true,
  key = "ultrasound",
  config = {
    
  },
  rarity = 1,
  pos = { x = 0, y = 9},
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)

  end,
}
return { name = {"Jokers"}, items = {ultrasound} }
