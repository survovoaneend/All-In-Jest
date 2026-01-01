local peeping_tom = {
  object_type = "Joker",
  order = 154,

  key = "peeping_tom",
  config = {
      future_sense = 3
  },
  rarity = 1,
  pos = { x = 23, y = 5 },
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
      local main_end = {}
      if G.deck ~= nil and card.area.config.type == "joker" and #G.deck.cards > 0 then
          localize{type = 'other', key = 'aij_future_sight_tip', nodes = main_end, vars = {}}
          main_end = main_end[1]
      end
      return { vars = { card.ability.future_sense }, main_end = main_end }
  end,

  calculate = function(self, card, context)
    
  end,
  generate_ui = function(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
      SMODS.Joker.super.generate_ui(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
      if G.deck ~= nil and cardd.area.config.type == "joker" then
          local cards = {}
          for i = #G.deck.cards, #G.deck.cards - cardd.ability.future_sense + 1, -1 do
              if i > 0 then
                  local card = copy_card(G.deck.cards[i], nil, nil, G.playing_card)

                  -- Re-adds negative to preview if it was stripped by the mod
                  if G.deck.cards[i].edition and G.deck.cards[i].edition.negative and not All_in_Jest.config.no_copy_neg then
                      card:set_edition({negative = true}, nil, true)
                  end

                  card.facing = 'front'
                  table.insert(cards,card)
              end
          end
          AllInJest.card_area_preview(nil,desc_nodes,{
              override = true,
              cards = cards,
              w = 1.5,
              h = 0.4,
              ml = 0,
              scale = 0.4,
          })
      end
  end,
}
return { name = {"Jokers"}, items = {peeping_tom} }
