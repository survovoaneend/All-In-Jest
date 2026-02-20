local arlecchina = {
  object_type = "Joker",
  order = 163,

  key = "arlecchina",
  config = {
    extra = {
      xmult = 1,
      xmult_mod = 0.2
    }
  },
  rarity = 2,
  pos = { x = 7, y = 6},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xmult_mod,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.skipping_booster and not context.blueprint then
      if context.booster.kind == "Buffoon" or context.booster.kind == "Standard" then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "xmult",
          scalar_value = "xmult_mod",
        })
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end
}
return { name = {"Jokers"}, items = {arlecchina} }
