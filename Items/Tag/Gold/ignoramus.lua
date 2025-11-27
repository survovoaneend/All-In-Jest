local ignoramus_tag = {
  object_type = "Tag",
  key = 'ignoramus',

  pos = { x = 10, y = 0 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'buffoon',
    },
  },

  discovered = false,
  order = 13,
  min_ante = 3,

  loc_vars = function(self, info_queue, tag)
    return { vars = {} }
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      tag:jest_apply("+", G.C.ATTENTION, function()
          if (#G.jokers.cards + G.GAME.joker_buffer) < G.jokers.config.card_limit then
            G.E_MANAGER:add_event(Event({
              func = function()
                G.SETTINGS.paused = true
                G.FUNCS.overlay_menu {
                  config = { no_esc = true },
                  definition = SMODS.jest_no_back_card_collection_UIBox(
                    G.P_CENTER_POOLS.Joker,
                    { 5, 5, 5 },
                    {
                      no_materialize = true,
                      modify_card = function(card, center)
                        if card.config.center.discovered and (card.config.center.rarity == 1 or card.config.center.rarity == 2) then
                          jest_create_select_card_ui(card, G.jokers)
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
          return (#G.jokers.cards + G.GAME.joker_buffer) < G.jokers.config.card_limit
        end)
      if (#G.jokers.cards + G.GAME.joker_buffer) < G.jokers.config.card_limit then
        tag.triggered = true
        return true
      end
      return
    end
  end,
}
return { name = "Tags", items = { ignoramus_tag } }
