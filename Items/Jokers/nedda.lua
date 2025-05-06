local nedda = {
  object_type = "Joker",
  order = 1008,

  key = "nedda",
  config = {
    extra = {
      xmult = 2
    }
  },
  rarity = 4,
  unlock_condition = { hidden = true },
  pos = { x = 7, y = 0 },
  atlas = 'legendary_atlas',
  cost = 20,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = { x = 7, y = 1 },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if not context.end_of_round and context.individual and context.cardarea == G.hand and context.other_card:get_id() == 12 then
      if context.other_card.debuff then
        return {
            message = localize('k_debuffed'),
            colour = G.C.RED,
            card = card,
        }
      else
        return {
          card = card,
          xmult = card.ability.extra.xmult,
        }
      end
    end
  end
}
return { name = {"Jokers"}, items = {nedda} }

