local dizzard = {
  object_type = "Joker",
  order = 161,
  ignore = true,
  key = "dizzard",
  config = {
    
  },
  rarity = 3,
  pos = { x = 5, y = 6},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)

  end,

  calculate = function(self, card, context)
    if context.skip_blind then
        stop_use()
            G.deck:shuffle('cashout'..G.GAME.round_resets.ante)
            G.deck:hard_set_T()
            delay(0.3)
            G.E_MANAGER:add_event(Event({
              trigger = 'immediate',
              func = function()
                  if G.blind_select then 
                    G.blind_select:remove()
                    G.blind_select = nil
                  end
                  G.GAME.current_round.jokers_purchased = 0
                  G.GAME.current_round.discards_left = math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards)
                  G.GAME.current_round.hands_left = (math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands))
                  G.STATE = G.STATES.SHOP
                  G.GAME.shop_free = nil
                  G.GAME.shop_d6ed = nil
                  G.STATE_COMPLETE = false
                return true
              end
            }))
    end
  end
}
return { name = {"Jokers"}, items = {dizzard} }
