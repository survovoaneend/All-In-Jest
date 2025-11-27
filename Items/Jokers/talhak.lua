local talhak = {
  object_type = "Joker",
  order = 1059,

  key = "talhak",
  config = {
    trigger = false
  },
  rarity = 4,
  pos = { x = 8, y = 10 },
  atlas = 'legendary_atlas',
  cost = 20,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = { x = 8, y = 11 },

  loc_vars = function(self, info_queue, card)

  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.beat_boss and not context.blueprint then
      card.ability.trigger = true
      local eval = function() return G.STATE ~= G.STATES.SHOP end
      juice_card_until(card, eval, true)
    end
    if context.cashing_out and card.ability.trigger then
      if (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
          { message = localize("k_plus_spectral"), colour = G.C.SECONDARY_SET.Spectral })
        G.E_MANAGER:add_event(Event({
          func = function()
            G.SETTINGS.paused = true
            G.FUNCS.overlay_menu {
              config = { no_esc = true },
              definition = SMODS.jest_no_back_card_collection_UIBox(
                G.P_CENTER_POOLS.Spectral,
                { 4, 5 },
                {
                  no_materialize = true,
                  modify_card = function(card, center)
                    if card.config.center.discovered then
                      if card.config.center.hidden then
                        card.greyed = true
                      else
                        jest_create_select_card_ui(card, G.consumeables)
                      end
                    end
                  end,
                  h_mod = 1.05,
                }
              ),
            }
            return true
          end
        }))
      end
      if not context.blueprint then
        G.E_MANAGER:add_event(Event({
          func = (function()
            card.ability.trigger = false
            return true
          end)
        }))
      end
    end
  end,
}
return { name = { "Jokers" }, items = { talhak } }
