local the_child = {
  object_type = "Blind",
  key = 'the_child',
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
  boss_colour = HEX("c1b297"),
  atlas = 'blinds',
  pos = { y = 2 },
  order = 503,
  dollars = 6,

  calculate = function(self, blind, context)
    local temp = G.GAME.blind and G.GAME.blind.disabled
    if temp then
      return
    end

    if context.before and G.hand.cards and not temp then
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i].base ~= 2 then
          blind.triggered = true
          break
        end
      end
    end

    if context.after and context.scoring_hand and not temp and blind.triggered then
      G.E_MANAGER:add_event(Event({
        func = function()
          blind:wiggle()
          return true
        end
      }))
      for i = 1, #context.scoring_hand do
        local percent = 1.15 - (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            if context.scoring_hand[i]:get_id() ~= 2 then
              context.scoring_hand[i]:flip()
              play_sound('card1', percent)
              context.scoring_hand[i]:juice_up(0.3, 0.3)
            end
            return true
          end
        }))
      end
      for i = 1, #context.scoring_hand do
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.1,
          func = function()
            if context.scoring_hand[i]:get_id() ~= 2 then
              assert(SMODS.modify_rank(context.scoring_hand[i], -1))
            end
            return true
          end
        }))
      end
      for i = 1, #context.scoring_hand do
        local percent = 0.85 + (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            if context.scoring_hand[i].facing == "back" then
              context.scoring_hand[i]:flip()
              play_sound('tarot2', percent, 0.6)
              context.scoring_hand[i]:juice_up(0.3, 0.3)
            end
            return true
          end
        }))
      end
      delay(0.5)
      blind.triggered = false
    end
  end
}
return { name = { "Pit Blinds" }, items = { the_child } }
