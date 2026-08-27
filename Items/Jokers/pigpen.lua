local pigpen = {
  object_type = "Joker",
  order = 179,
  

  key = "pigpen",
  config = {
    
  },
  attributes = { 'chips', 'hand_level' },
  rarity = 2,
  pos = { x = 19, y = 6},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)

  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = to_number(G.GAME.hands[context.scoring_name].played) * to_number(G.GAME.hands[context.scoring_name].level)
      }
    end
  end
}
return { name = {"Jokers"}, items = {pigpen} }
