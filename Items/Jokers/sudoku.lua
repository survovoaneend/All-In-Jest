local sudoku = {
  object_type = "Joker",
  order = 165,

  key = "sudoku",
  config = {
    extra = {
      xmult = 1,
      bonus = 0.3
    }
  },
  rarity = 2,
  pos = { x = 9, y = 6},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  pixel_size = { w = 70, h = 74 },

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
              if context.poker_hands and next(context.poker_hands['Straight']) then
                  card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.bonus
                  card_eval_status_text(card, 'extra', nil, nil, nil, {
                      message = 'Upgrade!',
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
  end
}
return { name = {"Jokers"}, items = {sudoku} }
