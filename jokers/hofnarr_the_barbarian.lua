SMODS.Joker {
    key = "hofnarr_the_barbarian",
    config = {
      extra = {
        mult = 10,
        xmult = 10
      }
    },
    rarity = 2,
    pos = { x = 11, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = {set = 'Other', key = 'finisher_blind'}
      return { vars = {card.ability.extra.mult, card.ability.extra.xmult} }
    end,
  
    calculate = function(self, card, context)
      if context.setting_blind and not self.getting_sliced and context.blind.boss and math.fmod(G.GAME.round_resets.ante, 8) == 0 then
        G.E_MANAGER:add_event(Event({func = function()
          G.E_MANAGER:add_event(Event({func = function()
              G.GAME.blind:disable()
              play_sound('timpani')
              delay(0.4)
              return true end }))
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
      return true end }))
      
      end
      if context.joker_main then
        if math.fmod(G.GAME.round_resets.ante, 8) == 0 and G.GAME.blind:get_type() == 'Boss' then
          return {
            xmult = card.ability.extra.xmult,
          }
        else
          return {
            mult = card.ability.extra.mult,
          }
        end
      end
    end
  }