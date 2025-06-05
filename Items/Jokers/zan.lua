local zan = {
  object_type = "Joker",
  order = 241,
  ignore = true,

  key = "zan",
  config = {
    
  },
  rarity = 'aij_familiar_face',
  unlock_condition = { hidden = true },
  pos = { x = 0, y = 2 },
  atlas = 'familiar_atlas',
  cost = 10,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = { x = 0, y = 3 },

  loc_vars = function(self, info_queue, card)
    return { }
  end,

  calculate = function(self, card, context)

  end
}
return { name = {"Jokers"}, items = {zan} }

