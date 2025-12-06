local dizzard = {
  object_type = "Joker",
  order = 161,

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
          G.GAME.all_in_jest.dizzard_shop = true
          stop_use()
          if G.blind_select then
              G.blind_select.alignment.offset.y = G.ROOM.T.y + 39
              G.blind_select.alignment.offset.x = 0
          end
          G.deck:shuffle('cashout'..G.GAME.round_resets.ante)
          G.deck:hard_set_T()
          G.GAME.current_round.reroll_cost_increase = 0
          G.GAME.current_round.used_packs = {}
          G.GAME.current_round.free_rerolls = G.GAME.round_resets.free_rerolls
          calculate_reroll_cost(true)
          if G.blind_prompt_box then
              G.blind_prompt_box:get_UIE_by_ID('prompt_dynatext1').config.object.pop_delay = 0
              G.blind_prompt_box:get_UIE_by_ID('prompt_dynatext1').config.object:pop_out(5)
              G.blind_prompt_box:get_UIE_by_ID('prompt_dynatext2').config.object.pop_delay = 0
              G.blind_prompt_box:get_UIE_by_ID('prompt_dynatext2').config.object:pop_out(5) 
          end
          delay(0.3)
          G.E_MANAGER:add_event(Event({
              trigger = 'after',
              func = function()
                  if G.blind_select then
                      G.blind_select:remove()
                      G.blind_prompt_box:remove()
                      G.blind_select = nil
                  end
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
