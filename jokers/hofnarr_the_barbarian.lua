SMODS.Joker {
    key = "hofnarr_the_barbarian",
    config = {
      
    },
    loc_txt = {
      name = "Hofnarr the Barbarian",
      text ={
          "{C:attention}Disables{} the {C:attention}Boss Blind{} on Ante {C:attention}8{}",
      },
  },
    rarity = 1,
    pos = { x = 11, y = 8},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.setting_blind and not self.getting_sliced and context.blind.boss and G.GAME.round_resets.ante == 8 then
        G.E_MANAGER:add_event(Event({func = function()
          G.E_MANAGER:add_event(Event({func = function()
              G.GAME.blind:disable()
              play_sound('timpani')
              delay(0.4)
              return true end }))
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
      return true end }))
      end
    end
  }