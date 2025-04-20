SMODS.Joker {
  key = "tetraphobia",
  config = {
    extra = { bonus_mult = 0 }
  },
  rarity = 1,
  pos = {x = 8, y = 5 },
  atlas = 'joker_atlas',
  cost = 5,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.bonus_mult or 0 } }
  end,

  calculate = function(self, card, context)
      -- Gain mult on discard
      if context.discard and context.other_card and context.other_card:get_id() == 4 then
          card.ability.extra.bonus_mult = (card.ability.extra.bonus_mult or 0) + 1
          card_eval_status_text(card, 'extra', nil, nil, nil, {
              message = '+'..(card.ability.extra.bonus_mult or 0)..' Mult',
              colour = G.C.MULT
          })
          return { card = card }
      end

      -- Reset mult on playing a 4
      if context.individual and context.cardarea == G.play and context.other_card and context.other_card:get_id() == 4 then
          if (card.ability.extra.bonus_mult or 0) > 0 then
               card.ability.extra.bonus_mult = 0
               card_eval_status_text(card, 'extra', nil, nil, nil, {
                  message = localize('k_reset')..'!',
                  colour = G.C.RED
               })
               return { card = card } -- Indicate trigger
          end
      end

      -- Apply mult during scoring if bonus is > 0
      if context.joker_main and (card.ability.extra.bonus_mult or 0) > 0 then
          return {
              mult_mod = card.ability.extra.bonus_mult,
              card = card,
              message = localize{type='variable',key='a_mult',vars={card.ability.extra.bonus_mult}}
          }
        end
  end
}