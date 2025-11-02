local la_commedia_e_finita = {
  object_type = "Joker",
  order = 155,

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
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult_gain,
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if (context.remove_playing_cards or context.cards_destroyed) and not context.blueprint then
      local removed_cards = context.glass_shattered or context.removed
      local face_cards = 0
      for k, val in ipairs(removed_cards) do
        if val:is_face() then face_cards = face_cards + 1 end
      end
      for _ = 1, face_cards do
        SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "mult",
	        scalar_value = "mult_gain",
            message_key = 'a_mult'
        })
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
return { name = {"Jokers"}, items = {la_commedia_e_finita} }
