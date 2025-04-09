SMODS.Joker {
  key = "open_mind",
  config = {
    extra = { packs = 2 }
  },
  loc_txt = {
    name = "Open Mind",
    text ={
        "{C:attention}#1#{} additional random {C:attention}Booster Packs{}",
        "available for purchase in every {C:attention}shop{}"
    },
},
  rarity = 3,
  pos = { x = 22, y = 4 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = false,

  loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.packs} }
  end,

  calculate = function(self, card, context)
      if context.starting_shop and not context.blueprint then
          if G.shop_booster and G.shop_booster.config and G.shop_booster.cards then
              local can_add = G.shop_booster.config.card_limit - #G.shop_booster.cards
              local num_to_add = math.min(can_add, card.ability.extra.packs)

              if num_to_add > 0 then
                  for i = 1, num_to_add do
                      SMODS.add_booster_to_shop()
                  end
                  card:juice_up(0.5, 0.3)
                  play_sound('button')
                  card_eval_status_text(card, 'extra', nil, nil, nil, {
                      message = '+'..num_to_add..' Booster',
                      colour = G.C.SECONDARY_SET.Spectral
                  })
                  return { card = card }
              end
          end
      end
  end
}