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
    if context.remove_playing_cards and not context.blueprint then
      local face_cards = 0
      for k, val in ipairs(context.removed) do
        if val:is_face() then face_cards = face_cards + 1 end
      end
      if face_cards > 0 then
        card.ability.extra.chips = card.ability.extra.chips + (face_cards * card.ability.extra.chip_gain)
        return {
          message = '+' .. card.ability.extra.chips,
          colour = G.C.BLUE
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
        card.ability.extra.chips = card.ability.extra.chips + (face_cards * card.ability.extra.chip_gain)
        return {
          message = '+' .. card.ability.extra.chips,
          colour = G.C.BLUE
        }
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
