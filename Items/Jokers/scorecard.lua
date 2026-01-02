local scorecard = {
  object_type = "Joker",
  order = 69,

  key = "scorecard",
  config = {
    extra = {
      levels = 2,
    }
  },
  rarity = 1,
  pos = { x = 15, y = 2 },
  atlas = 'joker_atlas',
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.levels
      }
    }
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      local _poker_hands = {}
      for k, v in pairs(G.GAME.hands) do
        if v.visible then _poker_hands[#_poker_hands + 1] = k end
      end

      local hand = pseudorandom_element(_poker_hands, pseudoseed('scorecard'))
      return {
        message = localize('k_level_up_ex'),
        level_up = card.ability.extra.levels,
        level_up_hand = hand
      }
    end
  end

}
return { name = { "Jokers" }, items = { scorecard } }
