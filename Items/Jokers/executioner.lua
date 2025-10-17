local executioner = {
  object_type = "Joker",
  order = 167,

  key = "executioner",
  config = {
    extra = {
      chips = 0,
      chip_gain = 50
    }
  },
  rarity = 2,
  pos = { x = 11, y = 6},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chip_gain,
        card.ability.extra.chips
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
            ref_value = "chips",
	        scalar_value = "chip_gain",
            message_key = 'a_chips'
        })
      end
      return
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
      }
    end
  end
}
return { name = {"Jokers"}, items = {executioner} }
