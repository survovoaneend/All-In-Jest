SMODS.Joker {
  key = "null_joker",
  config = {
    extra = { original_prob = 1, is_nullifying = false }
  },
  rarity = 1,
  pos = { x = 7, y = 3 },
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
      return {}
  end,

  add_to_deck = function(self, card, from_debuff)
      if not from_debuff then
          if G.GAME.probabilities.normal > 0 then
              card.ability.extra.original_prob = G.GAME.probabilities.normal
              G.GAME.probabilities.normal = 0
              card.ability.extra.is_nullifying = true
          end
      end
  end,

  remove_from_deck = function(self, card, from_debuff)
      if not from_debuff then
          if card.ability.extra.is_nullifying then
              local other_null_jokers = false
              if G.jokers and G.jokers.cards then
                  for _, other_card in ipairs(G.jokers.cards) do
                      if other_card ~= card and other_card.config.center.key == self.key then
                          other_null_jokers = true
                          break
                      end
                  end
              end

              if not other_null_jokers then
                  G.GAME.probabilities.normal = card.ability.extra.original_prob or 1
              end
              card.ability.extra.is_nullifying = false
          end
      end
  end,

  calculate = function(self, card, context)

  end
}