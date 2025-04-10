SMODS.Joker {
  key = "executioner",
  config = {
    extra = {
      chips = 0,
      chip_gain = 50
    }
  },
  loc_txt = {
    name = "Executioner",
    text ={
        "Gains {C:blue}+50{} Chips when",
        "a {C:attention}Face Card{} is",
        "{C:attention}destroyed"
    },
  },
  rarity = 2,
  pos = { x = 11, y = 6},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cards_destroyed and not context.blueprint then
      local faces = 0
      for k, v in ipairs(context.glass_shattered) do
          if v:is_face() then
              faces = faces + 1
          end
      end
      if faces > 0 then
          G.E_MANAGER:add_event(Event({
              func = function()
          G.E_MANAGER:add_event(Event({
              func = function()
                  card.ability.extra.chips = card.ability.extra.chips + faces*card.ability.extra.chip_gain
                return true
              end
            }))
          card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips + faces*card.ability.extra.chip_gain}}})
          return true
      end
    }))
  end
  end
  if context.joker_main then
    return {
      chips = card.ability.extra.chips
    }
  end
  end
}