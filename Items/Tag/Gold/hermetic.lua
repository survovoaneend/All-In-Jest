local hermetic_tag = {
  object_type = "Tag",
  key = 'hermetic',
  pos = { x = 10, y = 2 },
  atlas = 'tag_atlas',
  discovered = false,
  order = 16,
  min_ante = 3,
  config = {
    aij = {
      upgrade = 'ethereal',
    }
  },

  loc_vars = function(self, info_queue)
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      tag:jest_apply("+", G.C.ATTENTION, function()
          if (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
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
                          if G.GAME.banned_keys[card.config.center.key] then
                            card.debuff = true
                          elseif card.config.center.hidden then
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
          return true
        end,
        function()
          return (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit
        end)
      tag.triggered = true
      return true
    end
  end,
}
return { name = "Tags", items = { hermetic_tag } }
