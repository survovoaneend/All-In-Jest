local broken_fate = {
  object_type = "Consumable",
  key = 'broken_fate',
  set = 'Tarot',
  pos = { x = 6, y = 5 },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize('k_tarot_q'), G.C.SECONDARY_SET.Tarot, G.C.WHITE, 1.2)
  end,
  cost = 3,
  unlocked = true,
  discovered = false,
  order = 23,
  config = {},
  atlas = 'consumable_atlas',
  loc_vars = function(self, info_queue, card)

  end,
  can_use = function(self, card, area, copier)
    if G.consumeables and #G.consumeables.cards > 0 then
      local leftmost_card = G.consumeables.cards[1]
      leftmost_card = leftmost_card == card and G.consumeables.cards[2] or leftmost_card
      return leftmost_card.config.center.key ~= "c_aij_broken_fate"
    end
  end,
  use = function(self, card)
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
      play_sound('tarot1')
      card:juice_up(0.3, 0.5)
      return true end }))
    delay(0.2)

    local ran_amount = 0.75 + (pseudorandom('aij_broken_fate', 0, math.floor(((2.5 - 0.75) / 0.05) + 0.5)) * 0.05)
    local string = "X" .. tostring(ran_amount)
    G.consumeables.cards[1].ability.consumeable = copy_table(G.consumeables.cards[1].ability.consumeable)
    jest_ability_calculate(G.consumeables.cards[1], "*", ran_amount, nil, nil, true, false, "ability")
    card_eval_status_text(G.consumeables.cards[1], 'extra', nil, nil, nil, { message = string, colour = G.C.FILTER })
    delay(0.2)
  end,
  in_pool = function(self, args)
    if G.consumeables and #G.consumeables.cards > 0 then
      return true
    end
    return false
  end,
}
return { name = { "Tarots" }, items = { broken_fate } }
