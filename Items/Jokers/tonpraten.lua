local tonpraten = {
  object_type = "Joker",
  order = 172,
  

  key = "tonpraten",
  config = {
    extra = {
      mult = 10
    }
  },
  rarity = 1,
  pos = { x = 15, y = 6},
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.final_scoring_step and context.cardarea == G.jokers then
      return {
        mult = card.ability.extra.mult
      }
    end
  end
}
return { name = {"Jokers"}, items = {tonpraten} }
