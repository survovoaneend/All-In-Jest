local joculator = {
  object_type = "Joker",
  order = 174,

  key = "joculator",
  config = {
    extra = {
        hand_amount = 1,
    }
  },
  rarity = 2,
  pos = { x = 17, y = 6},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
      return {
            vars = {
                card.ability.extra.hand_amount,
            }
      }
  end,

  calculate = function(self, card, context)
      if context.hand_drawn and G.GAME.current_round.discards_left == 0 and G.GAME.current_round.hands_left == card.ability.extra.hand_amount and not context.blueprint then
          for i = 1, G.hand.config.card_limit do
              if #G.deck.cards > 0 then
                  G.E_MANAGER:add_event(Event({
                      func = function()
                      draw_card(G.deck,G.hand, 90,'up', nil)
                      return true
                      end
                  }))
              end
          end
      end
  end
}
return { name = {"Jokers"}, items = {joculator} }
