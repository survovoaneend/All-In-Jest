local the_arrow = {
  object_type = "Blind",
  key = 'the_arrow',
  boss = {
    min = 4,
    all_in_jest = {
      pit = true
    }
  },
  in_pool = function(self)
    return All_in_Jest.pit_blinds_in_play()
  end,
  mult = 2,
  boss_colour = HEX("967465"),
  atlas = 'blinds_pit',
  pos = { y = 12 },
  order = 513,
  dollars = 6,

  calculate = function(self, blind, context)
    local temp = G.GAME.blind and G.GAME.blind.disabled
    if temp then
      return
    end
    if context.all_in_jest and context.all_in_jest.before_after and not temp then
      local bool = false
      for i = 1, #G.GAME.all_in_jest.advanced_hand_usage_blind do
        if context.total_chips <= G.GAME.all_in_jest.advanced_hand_usage_blind[i].total_chips then
          bool = true
        end
      end
      if bool then
        mult = mod_mult(0)
        hand_chips = mod_chips(0)
        SMODS.displayed_hand = nil
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = (function()
            blind:wiggle()
            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.06 * G.SETTINGS.GAMESPEED,
              blockable = false,
              blocking = false,
              func = function()
                play_sound('tarot2', 0.76, 0.4); return true
              end
            }))
            play_sound('tarot2', 1, 0.4)
            return true
          end)
        }))

        play_area_status_text(localize('k_not_allowed_ex'))
        
        SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, debuffed_hand = true})

        -- G.E_MANAGER:add_event(Event({
        --   trigger = 'after',
        --   delay = 0.4,
        --   func = function()
        --     update_hand_text({ delay = 0 }, { mult = 0, chips = 0, chip_total = 0, level = '', handname = "Not Allowed!" })
        --     play_sound('button', 0.9, 0.6)
        --     return true
        --   end
        -- }))
        -- G.GAME.all_in_jest.reset_score.chip_total = true
      end
    end
  end
}
return { name = { "Pit Blinds" }, items = { the_arrow } }
