local animatronic = {
  object_type = "Joker",
  order = 198,

  key = "animatronic",
  config = {
    extra = {
      handsize_mod = 1,
      handsize = 0,
      cap = 3
    }
  },
  rarity = 1,
  pos = { x = 12, y = 7 },
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.handsize_mod,
        card.ability.extra.handsize,
        card.ability.extra.cap
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and context.scoring_name and not context.blueprint then
      if context.poker_hands and next(context.poker_hands['Straight']) then
        if card.ability.extra.handsize < card.ability.extra.cap then
          card.ability.extra.handsize = card.ability.extra.handsize + card.ability.extra.handsize_mod
          G.hand:change_size(card.ability.extra.handsize_mod)
          return {
            message = "+1 Hand Size"
          }
        end
      else
        if card.ability.extra.handsize > 0 then
          G.hand:change_size(-card.ability.extra.handsize)
          card.ability.extra.handsize = 0
          return {
            message = "Reset!"
          }
        end
      end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.handsize)
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.handsize)
  end,

}
return { name = { "Jokers" }, items = { animatronic } }
