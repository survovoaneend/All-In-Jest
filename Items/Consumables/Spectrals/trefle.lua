local trefle_spectral = {
  object_type = "Consumable",
  key = 'trefle',
  set = 'Spectral',
  pos = { x = 1, y = 4 },
  cost = 4,
  lite = true,
  unlocked = true,
  discovered = false,
  order = 0.5,
  config = {},
  atlas = 'consumable_atlas',
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { set = 'Other', key = 'reroll_joker' }
    return { key = G.CONTROLLER.HID.controller and "c_aij_trefle_controller" or "c_aij_trefle" }
  end,
  can_use = function(self, card, area, copier)
    local victim_card = nil

    -- If controller is used, will select the rightmost joker
    -- Otherwise, will select the highlighted joker
    -- Done this way as you cannot highlight jokers with a controller
    if G.CONTROLLER.HID.controller then
      if G.jokers and (#G.jokers.cards >= 1) and G.jokers.cards[#G.jokers.cards] then
        victim_card = G.jokers.cards[#G.jokers.cards]
      end
    else
      if G.jokers and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] then
        victim_card = G.jokers.highlighted[1]
      end
    end
    return victim_card and not SMODS.is_eternal(victim_card, card)
  end,

  use = function(self, card, area, copier)
    local victim_card = nil
    if G.CONTROLLER.HID.controller then
      if G.jokers and (#G.jokers.cards >= 1) and G.jokers.cards[#G.jokers.cards] then
        victim_card = G.jokers.cards[#G.jokers.cards]
      end
    else
      if G.jokers and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] then
        victim_card = G.jokers.highlighted[1]
      end
    end
    if victim_card then
      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end }))
      All_in_Jest.reroll_joker(victim_card, nil, 'trefle')
    end
    return true
  end
}
return { name = { "Spectrals" }, items = { trefle_spectral } }
