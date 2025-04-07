SMODS.Joker {
  key = "guiser",
  config = {
    extra = {
      money = 5
    }
  },
  loc_txt = {
    name = "Guiser",
    text ={
        "Gains {C:money}$5{} of {C:attention}sell value{}",
        "when a {C:tarot}Tarot{} card is used"
    },
},
  rarity = 3,
  pos = { x = 1, y = 6},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)

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