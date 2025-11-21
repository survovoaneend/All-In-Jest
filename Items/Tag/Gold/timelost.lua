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
        local key = 'p_aij_guess_the_jest'
        local card = Card(G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
          G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2, G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
          G.P_CENTERS[key], { bypass_discovery_center = true, bypass_discovery_ui = true })
        card.cost = 0
        card.from_tag = true
        G.GAME.temp_create_card = {}
        G.GAME.temp_create_card[1] = card.config.center.create_card
        card.ability.extra = 5
        card.fake_create_card = true
        card.config.center.create_card = function(self, card, i)
              local card_params = {
                set = "Joker",
                legendary = true,
                area = G.pack_cards,
                skip_materialize = true,
                soulable = false,
                key_append = "leg_guess",
                no_edition = true,

              }
              local _card = SMODS.create_card(card_params)
              if _card then
                _card.ability = _card.ability or {}
                _card.ability.from_guess_the_jest = true
                _card.ability.background = tostring(math.random(1, 4))
                for k, v in pairs(G.shared_stickers) do
                  if _card.ability[k] then
                    _card.ability[k] = false
                  end
                end
                _card.ability.perishable = true
                _card.ability.perish_tally = G.GAME.perishable_rounds or 5
              end
              return _card
            end,
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
