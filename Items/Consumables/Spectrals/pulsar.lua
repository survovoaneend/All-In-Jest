local pulsar_spectral = {
  object_type = "Consumable",
  key = 'pulsar',
  set = 'Spectral',
  pos = { x = 2, y = 4 },
  cost = 4,
  hidden = true,
  soul_rate = 0.003,
  soul_set = 'Planet',
  unlocked = true,
  discovered = false,
  order = 20,
  config = { moon = true },
  atlas = 'consumable_atlas',
  loc_vars = function(self, info_queue, card)
  end,
  can_use = function(self, card)
    return true
  end,
  use = function(self, card, area, copier)
    update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize('k_all_hands'),chips = '...', mult = '...', level=''})
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = true
        return true end }))
    update_hand_text({delay = 0}, {mult = '+', StatusText = true})
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = nil
        return true end }))
    update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+1'})
    delay(1.3)
    level_up_hand_mult(card, nil, true)
    update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
  end,
}
return { name = { "Spectrals", "Planets" }, items = { pulsar_spectral } }
