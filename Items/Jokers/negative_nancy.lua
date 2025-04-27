local negative_nancy = {
  object_type = "Joker",
  order = 20,

  key = "negative_nancy",

  rarity = 1,
  pos = { x = 18, y = 0 },
  atlas = 'joker_atlas', 
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = G.P_CENTERS.e_negative
      return {}
  end,

  calculate = function(self, card, context)
    return nil
  end
}

SMODS.Edition:take_ownership('e_negative', {
  get_weight = function(self)
      local weight = (self.weight or 0.01) * (G.GAME and G.GAME.edition_rate or 1)
      local nancy_jokers = SMODS.find_card('j_aij_negative_nancy', false) -- false = don't count debuffed

      if #nancy_jokers > 0 then
          weight = weight * (3 ^ #nancy_jokers)
      end

      return weight
  end
})
return { name = {"Jokers"}, items = {negative_nancy} }
