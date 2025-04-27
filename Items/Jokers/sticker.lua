local sticker = {
  object_type = "Joker",
  order = 179,
  ignore = true,

  key = "sticker",
  config = {
    
  },
  rarity = 1,
  pos = { x = 22, y = 6},
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
return { name = {"Jokers"}, items = {sticker} }
