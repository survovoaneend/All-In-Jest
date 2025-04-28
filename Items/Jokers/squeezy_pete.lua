local squeezy_pete = {
  object_type = "Joker",
  order = 13,

  key = "squeezy_pete",

  config = {
      extra = {
          bonus = 0.5,
          xmult = 1
      }
  },

  rarity = 2,
  pos = { x = 12, y = 0 },
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,

  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
      return {
          vars = {
              card.ability.extra.bonus,
              card.ability.extra.xmult
          }
      }
  end,

  calculate = function(self, card, context)
      if context.before and context.scoring_name then
          if not context.blueprint then
              if context.scoring_name == 'Full House' or context.scoring_name == 'Flush House' then
                  card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.bonus
                  card_eval_status_text(card, 'extra', nil, nil, nil, {
                      message = 'X' .. number_format(card.ability.extra.xmult) .. ' Mult' ,
                  })
                  return nil, true
              else
                  if card.ability.extra.xmult > 1 then
                      card.ability.extra.xmult = 1
                      card_eval_status_text(card, 'extra', nil, nil, nil, {
                          message = 'Reset!',
                      })
                      return nil, true
                  end
              end
          end
      end

      if context.joker_main then
          if card.ability.extra.xmult > 1 then
              return {
                  xmult = card.ability.extra.xmult,
              }
          end
      end

      return nil
  end
}
return { name = {"Jokers"}, items = {squeezy_pete} }
