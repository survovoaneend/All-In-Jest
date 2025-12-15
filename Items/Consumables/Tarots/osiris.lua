local osiris = {
  object_type = "Consumable",
  key = 'osiris',
  set = 'Tarot',
  pos = { x = 6, y = 0 },
  cost = 3,

  unlocked = true,
  discovered = false,
  order = 6,
  config = { },
  atlas = 'consumable_atlas',

  loc_vars = function(self, info_queue, card)
    local victim_card = nil
    local money_earned = 0

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
    if victim_card and not SMODS.is_eternal(victim_card, card) then
      money_earned = (victim_card.sell_cost * 3)
    end
    return { vars = { money_earned }, key = G.CONTROLLER.HID.controller and "c_aij_osiris_controller" or "c_aij_osiris" }
  end,

  can_use = function(self, card, area, copier)
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
        return not SMODS.is_eternal(victim_card, card)
    else
        return false
    end
  end,

  use = function(self, card)
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
      local money_earned = (victim_card.sell_cost * 3)

      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true end }))
      delay(0.2)
      SMODS.destroy_cards(victim_card)
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.5,
        func = function()
          play_sound('timpani')
          card:juice_up(0.3, 0.5)
          ease_dollars(money_earned, true)
          return true
        end
      }))
      delay(0.3)
    end
  end,
}
return { name = { "Tarots" }, items = { osiris } }
