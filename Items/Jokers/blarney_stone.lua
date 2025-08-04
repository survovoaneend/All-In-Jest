local blarney_stone = {
  object_type = "Joker",
  order = 178,
  ignore = true,

  key = "blarney_stone",
  config = {
    
  },
  rarity = 1,
  pos = { x = 21, y = 6},
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
return { name = {"Jokers"}, items = {blarney_stone} }
