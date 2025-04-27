local rodeo_clown = {
  object_type = "Joker",
  order = 173,
  ignore = true,

  key = "rodeo_clown",
  config = {
    
  },
  rarity = 1,
  pos = { x = 16, y = 6},
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
return { name = {"Jokers"}, items = {rodeo_clown} }
