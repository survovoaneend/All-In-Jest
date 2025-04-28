local arlecchina = {
  object_type = "Joker",
  order = 163,
  ignore = true,

  key = "arlecchina",
  config = {
    
  },
  rarity = 1,
  pos = { x = 7, y = 6},
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
return { name = {"Jokers"}, items = {arlecchina} }
