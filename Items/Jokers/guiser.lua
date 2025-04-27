local guiser = {
  object_type = "Joker",
  order = 157,

  key = "guiser",
  config = {
    extra = {
      money = 5
    }
  },
  rarity = 3,
  pos = { x = 1, y = 6},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money
      }
    }
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint then
      if context.consumeable.ability.set == "Tarot" then
        card.ability.extra_value = card.ability.extra_value + card.ability.extra.money
        card:set_cost()
        return {
          message = localize('k_val_up'),
          colour = G.C.MONEY
        }
    end
  end
  end
}
return { name = {"Jokers"}, items = {guiser} }
