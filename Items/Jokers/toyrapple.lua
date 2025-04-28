local toyrapple = {
  object_type = "Joker",
  order = 238,
  ignore = true,

  key = "toyrapple",
  config = {
    
  },
  rarity = 'aij_familiar_face',
  unlock_condition = { hidden = true },
  pos = { x = 2, y = 0 },
  atlas = 'familiar_atlas',
  cost = 10,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = { x = 2, y = 1 },

  loc_vars = function(self, info_queue, card)
    return { }
  end,

  calculate = function(self, card, context)

  end
}
return { name = {"Jokers"}, items = {toyrapple} }

