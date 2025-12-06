local cyclops = {
  object_type = "Joker",
  order = 177,


  key = "cyclops",
  config = {
    extra = {
      repetitions = 4
    }
  },
  rarity = 3,
  pos = { x = 20, y = 6 },
  atlas = 'joker_atlas',
  cost = 9,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.repetitions
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      if #context.full_hand == 1 and context.full_hand[1]:get_id() == 14 then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
          func = (function()
            SMODS.add_card {
              set = 'Tarot',    
            }
            G.GAME.consumeable_buffer = 0
            return true
          end)
        }))
        return {
          message = localize('k_plus_tarot'),
          colour = G.C.SECONDARY_SET.Tarot,
        }
      end
    end
  end
}
return { name = { "Jokers" }, items = { cyclops } }
