local spoofy = {
  object_type = "Joker",
  order = 237,
  ignore = true,

  key = "spoofy",
  config = {
    
  },
  rarity = 'aij_familiar_face',
  unlock_condition = { hidden = true },
  pos = { x = 1, y = 0 },
  atlas = 'familiar_atlas',
  cost = 10,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = { x = 1, y = 1 },

  loc_vars = function(self, info_queue, card)
    return { }
  end,

  calculate = function(self, card, context)

  end
}
return { name = {"Jokers"}, items = {spoofy} }

