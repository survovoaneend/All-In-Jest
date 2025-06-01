local doodle = {
    object_type = "Joker",
    order = 27,

    key = "doodle",
    config = {
      extra = {
        odds = 2
      }
    },
    rarity = 3,
    pos = { x = 24, y = 0 },
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return { vars = { 
        ''..(G.GAME and G.GAME.probabilities.normal or 1),
        card.ability.extra.odds
      } }
    end,
  --thank you unstable
  calculate = function(self, card, context)
    -- Re-entrancy guard: If this specific card instance is already calculating, abort.
    if card.is_doodle_calculating then
        -- Log this occurrence for debugging if you want
        return nil, true -- Or just `return` if that's more appropriate for SMODS context
    end
    card.is_doodle_calculating = true -- Set the flag

    -- ... (rest of your original logic) ...
    local my_index = nil
    for i, joker_in_area in ipairs(G.jokers.cards) do
      if joker_in_area == card then
        my_index = i
        break
      end
    end

    if not my_index or #G.jokers.cards <= 1 then
      card.is_doodle_calculating = false -- Clear the flag before returning
      return
    end

    local target_joker1 = nil
    local target_joker2 = nil
    local num_jokers = #G.jokers.cards

    if my_index then
      if my_index > 1 then
        target_joker1 = G.jokers.cards[my_index - 1]
      end
      if my_index < num_jokers then
        target_joker2 = G.jokers.cards[my_index + 1]
      end
    end

    -- Prevent Doodle from trying to blueprint itself if it somehow became its own neighbor
    -- (though your current logic prevents this, it's a good safeguard for complex interactions)
    if target_joker1 == card then target_joker1 = nil end
    if target_joker2 == card then target_joker2 = nil end

    local effect_to_return = nil
    local did_probability_pass = false -- Keep track if the random check passed

    if pseudorandom('doodle' .. G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then
      did_probability_pass = true -- The check passed

      local effect1_def
      if target_joker1 then
        effect1_def = SMODS.blueprint_effect(card, target_joker1, context)
      end
 
      local effect2_def
      if target_joker2 then
        effect2_def = SMODS.blueprint_effect(card, target_joker2, context)
      end
 
      if effect1_def then
        if effect2_def then
          effect1_def.extra = effect2_def -- Chain the effects
        end
        effect_to_return = effect1_def
      elseif effect2_def then
        effect_to_return = effect2_def
      else
        -- No effect was generated from blueprinting (e.g., neighbors had no effect or were also guarded)
        effect_to_return = nil 
      end
    end

    card.is_doodle_calculating = false -- CRITICAL: Clear the flag before any return path

    if did_probability_pass then
        -- If probability passed, return whatever effect was determined (could be nil if neighbors had no effect)
        return effect_to_return 
    else
        -- If probability did not pass, return (nil, true) as in original logic
        return nil, true
    end
end
  
}
return { name = {"Jokers"}, items = {doodle} }
