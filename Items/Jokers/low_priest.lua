local low_priest = {
  object_type = "Joker",
  order = 72,
  lite = true,
  key = "low_priest",
  config = {
    extra = {
      xmult = 1,
      initial_xmult = 3,
      xmult_mod = 0.2
    }
  },
  rarity = 2,
  pos = { x = 1, y = 9 },
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.initial_xmult,
        card.ability.extra.xmult_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      card.ability.extra.xmult = card.ability.extra.initial_xmult - card.ability.extra.xmult_mod * to_number(G.GAME.hands[context.scoring_name].level)
      return {
        xmult = math.max(1, card.ability.extra.xmult)
      }
    end
  end
}
return { name = { "Jokers" }, items = { low_priest } }
