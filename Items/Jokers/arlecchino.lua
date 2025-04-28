local arlecchino = {
  object_type = "Joker",
  order = 162,
  ignore = true,

  key = "arlecchino",
  config = {
    
  },
  rarity = 1,
  pos = { x = 6, y = 6},
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
return { name = {"Jokers"}, items = {arlecchino} }
