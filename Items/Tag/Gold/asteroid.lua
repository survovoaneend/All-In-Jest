local asteroid_tag = {
  object_type = "Tag",
  key = 'asteroid',

  pos = { x = 5, y = 3 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'meteor',
    },
  },

  discovered = false,
  order = 12,
  min_ante = 3,

  loc_vars = function(self, info_queue, tag)
    return { vars = {} }
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      tag:jest_apply('+', G.C.SECONDARY_SET.Planet, function()
          local key = 'p_aij_asteroid_tag_celestial'
          local card = Card(G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
            G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2, G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
            G.P_CENTERS[key], { bypass_discovery_center = true, bypass_discovery_ui = true })
          card.cost = 0
          card.from_tag = true
          G.FUNCS.use_card({ config = { ref_table = card } })
          card:start_materialize()
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
return { name = "Tags", items = { asteroid_tag } }
