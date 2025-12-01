local auspicious_tag = {
  object_type = "Tag",
  key = 'auspicious',

  pos = { x = 11, y = 1 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'aij_fortunate',
    },
  },

  discovered = false,
  order = 32,
  min_ante = 3,

  loc_vars = function(self, info_queue, tag)
    return { vars = {} }
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      tag:jest_apply("+", G.C.ATTENTION, function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.SETTINGS.paused = true
              G.FUNCS.overlay_menu {
                config = { no_esc = true },
                definition = SMODS.jest_no_back_card_collection_UIBox(
                  G.P_CENTER_POOLS.Tarot,
                  { 5, 6 },
                  {
                    no_materialize = true,
                    modify_card = function(card, center)
                      if card.config.center.discovered then
                        if G.GAME.banned_keys[card.config.center.key] and not (type(G.GAME.banned_keys[card.config.center.key]) == "string" and G.GAME.banned_keys[card.config.center.key]:sub(1, 5) == "j_aij") then
                            card.debuff = true
                        else
                            local edition = { negative = true }
                            card:set_edition(edition, true, true)
                            jest_create_select_card_ui(card, G.consumeables, { copies = 3 })
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
          return true
        end,
        function()
          return true
        end)
      tag.triggered = true
      return true
    end
  end,
}
return { name = "Tags", items = { auspicious_tag } }
