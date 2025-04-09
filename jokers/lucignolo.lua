SMODS.Joker {
  key = "lucignolo",
  config = {
    extra = { dollars = 5 }
  },
  loc_txt = {
    name = "Lucignolo",
    text ={
        "Earn {C:money}$#1#{} when any",
        "playing card is {C:attention}destroyed{}"
    },
},
  rarity = 1,
  pos = { x = 14, y = 2 },
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = false,

  loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.dollars} }
  end,

  calculate = function(self, card, context)
      if context.remove_playing_cards and context.removed and #context.removed > 0 then
          local money_to_earn = #context.removed * card.ability.extra.dollars
          if money_to_earn > 0 then
              ease_dollars(money_to_earn)
              card_eval_status_text(card, 'extra', nil, nil, nil, {
                  message = localize('$')..money_to_earn,
                  colour = G.C.MONEY
              })
              return { card = card }
          end
      end
  end
}