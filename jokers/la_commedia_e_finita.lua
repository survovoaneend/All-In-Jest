SMODS.Joker {
  key = "la_commedia_e_finita",
  config = {
    extra = {
      mult = 0,
      mult_gain = 5
    }
  },
  rarity = 1,
  pos = { x = 24, y = 5 },
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult_gain,
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      local face_cards = 0
      for k, val in ipairs(context.removed) do
        if val:is_face() then face_cards = face_cards + 1 end
      end
      if face_cards > 0 then
        card.ability.extra.mult = card.ability.extra.mult + (face_cards * card.ability.extra.mult_gain)
        return {
          message = '+' .. card.ability.extra.mult .. 'Mult',
          colour = G.C.RED
        }
      end
      return
    end
    if context.cards_destroyed and not context.blueprint then
      local face_cards = 0
      for k, val in ipairs(context.glass_shattered) do
        if val:is_face() then face_cards = face_cards + 1 end
      end
      if face_cards > 0 then
        card.ability.extra.mult = card.ability.extra.mult + (face_cards * card.ability.extra.mult_gain)
        return {
          message = '+' .. card.ability.extra.mult .. ' Mult',
          colour = G.C.RED
        }
      end
      return
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
      }
    end
  end
}