SMODS.Joker {
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
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = { x = 7, y = 1 },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if not context.end_of_round and context.individual and context.cardarea == G.hand and context.other_card:get_id() == 12 then
      return {
        card = card,
        xmult = card.ability.extra.xmult,
      }
    end
  end
}
