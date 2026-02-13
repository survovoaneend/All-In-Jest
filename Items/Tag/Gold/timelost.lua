local timelost_tag = {
  object_type = "Tag",
  key = 'timelost',

  pos = { x = 11, y = 2 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'aij_soulbound',
    },
  },

  discovered = false,
  order = 25,
  min_ante = 3,

  loc_vars = function(self, info_queue, tag)
    return { vars = {} }
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      tag:yep('+', G.C.RARITY[4], function()
        local key = 'p_aij_timelost_guess_the_jest'
        local card = Card(G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
          G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2, G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
          G.P_CENTERS[key], { bypass_discovery_center = true, bypass_discovery_ui = true })
        card.cost = 0
        card.from_tag = true
        G.FUNCS.use_card({ config = { ref_table = card } })
        card:start_materialize()
        return true
      end)
      tag.triggered = true
      return true
    end
  end,
}
return { name = "Tags", items = { timelost_tag } }
