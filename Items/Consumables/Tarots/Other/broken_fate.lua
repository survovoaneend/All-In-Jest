local function contains_number(table, exclusions)
    for k, v in pairs(table) do
        if exclusions and exclusions[k] ~= nil and (exclusions[k] == true or exclusions[k] == v) then
        else
            if type(v) == "number" and v ~= 0 then
                return true
            elseif type(v) == "table" and contains_number(v, exclusions) then
                return true
            end
        end
    end
    return false
end

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
      -- Check for Ankh and Hex explicitly, as they have unused variables that make it seem like they are compatible
      return (
          leftmost_card.config.center.key ~= "c_aij_broken_fate" and
          contains_number(leftmost_card.ability, { card_limit = true, h_x_chips = 1, x_chips = 1, h_x_mult = 1, x_mult = 1, hands_played_at_create = true, order = true }) and 
          leftmost_card.config.center.dongtong_compat ~= false
      )
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
    jest_ability_calculate(G.consumeables.cards[1], "*", ran_amount, { card_limit = true, h_x_chips = 1, x_chips = 1, h_x_mult = 1, x_mult = 1, hands_played_at_create = true, order = true }, nil, true, false, "ability")
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

-- Set some vanilla consumables to be incompatible
-- These have variables that look like they make it compatible, but actually aren't
-- Some of these (the seals) should be refactored to work as expected
G.P_CENTERS["c_ankh"].dongtong_compat = false
G.P_CENTERS["c_hex"].dongtong_compat = false
G.P_CENTERS["c_talisman"].dongtong_compat = false
G.P_CENTERS["c_trance"].dongtong_compat = false
G.P_CENTERS["c_medium"].dongtong_compat = false
G.P_CENTERS["c_deja_vu"].dongtong_compat = false

return { name = { "Tarots" }, items = { broken_fate } }
