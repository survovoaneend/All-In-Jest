--originally in paperback
function add_booster_pack(key,price)
    if not G.shop then return end

    local pack = Card(
        G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
        G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
        G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
        G.P_CENTERS[key],
        { bypass_discovery_center = true, bypass_discovery_ui = true }
  )
  if price then
    pack.cost = price
  end

  -- Create the price tag above the pack
  create_shop_card_ui(pack, 'Booster', G.shop_booster)

  -- Add the pack to the shop
  pack:start_materialize()
  G.shop_booster:emplace(pack)
end

function get_weighted_planet_pool(starting_pool, default_key, _append)
  local _starting_pool = starting_pool or G.P_CENTER_POOLS["Planet"]
  -- Use a local table instead of modifying G.ARGS if possible, or ensure G.ARGS.TEMP_POOL is managed correctly
  local _pool = {} -- Use a local temporary table

  local _total_weight = 0
  local _pool_size = 0

  -- Define weights for specific planets (higher value = more likely)
  -- Add your custom planet keys and desired weights here.
  -- Planets not listed will get a default weight of 1.
  local planet_weights = {
      -- Example Weights (Adjust these to your needs)
      ['c_mercury'] = 99,
      ['c_venus'] = 10,
      ['c_earth'] = 8,
      ['c_mars'] = 8,
      ['c_jupiter'] = 5, -- Make Jupiter less likely
      ['c_saturn'] = 10,
      ['c_uranus'] = 10,
      ['c_neptune'] = 5, -- Make Neptune less likely
      ['c_pluto'] = 10,
      ['c_planet_x'] = 3,
      ['c_ceres'] = 3,
      ['c_eris'] = 3,
      ['c_jen_haumea'] = 10, -- Example custom planet
      ['c_jen_sedna'] = 10, -- Example custom planet
      -- etc.
  }

  for k, card in ipairs(_starting_pool) do
      -- Ensure we're working with the center table, whether the input pool is keys or centers
      local planet_center = type(card) == "string" and G.P_CENTERS[card] or card

      -- Basic check to ensure the center exists
      if planet_center and planet_center.set == 'Planet' then
          local add = true -- Assume we can add unless checks fail

          -- 1. Check unlock status (Planets are usually always unlocked, but good practice)
          if planet_center.unlocked == false then add = false end

          -- 2. Check in_pool function if it exists
          local in_pool, pool_opts
          if add and planet_center.in_pool and type(planet_center.in_pool) == 'function' then
              in_pool, pool_opts = planet_center:in_pool({ source = _append })
              add = in_pool
          end
          pool_opts = pool_opts or {}

          -- 3. Check exclusion flags if they are relevant for your planets
          if add and planet_center.no_pool_flag and G.GAME.pool_flags[planet_center.no_pool_flag] then add = false end
          if add and planet_center.yes_pool_flag and not G.GAME.pool_flags[planet_center.yes_pool_flag] then add = false end

          -- 4. Check ban list
          if add and G.GAME.banned_keys[planet_center.key] then add = false end

          -- If all checks pass, determine and add weight
          if add then
              local weight = 1 -- Default weight

              -- Prioritize get_weight function if planets have one
              if planet_center.get_weight and type(planet_center.get_weight) == 'function' then
                  weight = planet_center:get_weight({ source = _append }) or 1
              -- Otherwise, use the predefined weight table
              elseif planet_weights[planet_center.key] ~= nil then
                  weight = planet_weights[planet_center.key]
              end

              -- Ensure weight is a positive number
              weight = (type(weight) == 'number' and weight > 0) and weight or 1

              _total_weight = _total_weight + weight
              _pool[#_pool + 1] = { key = planet_center.key, weight = weight }
              _pool_size = _pool_size + 1
          end
      end
  end

  -- Handle empty pool case
  if _pool_size == 0 then
      local fallback_key = default_key or 'c_pluto' -- Default to Pluto if nothing else works
      _total_weight = 1
      _pool[#_pool + 1] = { key = fallback_key, weight = 1 }
      print("Warning: Weighted planet pool was empty, defaulting to: " .. fallback_key)
  end

  -- Normalize weights (so they sum to 1)
  local normalization_factor = (_total_weight > 0) and _total_weight or 1
  for _, v in ipairs(_pool) do
      v.weight = v.weight / normalization_factor
  end

  return _pool
end


--- Get a random planet key from a weighted pool.
---@param starting_pool string[]|SMODS.Center[]? Optional pool to start from.
---@param default_key string? Optional fallback key (defaults to 'c_pluto').
---@param key_append string? Optional string to append to the pseudoseed.
---@return string The key of the selected planet.
function get_weighted_planet(starting_pool, default_key, key_append)
  -- Get the normalized weighted pool
  local pool = get_weighted_planet_pool(starting_pool, default_key, key_append)
  -- Generate a random number between 0 and 1
  local poll = pseudorandom(pseudoseed('weighted_planet_selection' .. G.GAME.round_resets.ante .. (key_append or '')))

  local weight_i = 0
  for _, v in ipairs(pool) do
      weight_i = weight_i + v.weight
      if poll <= weight_i then -- Use <= to handle potential floating point inaccuracies
          return v.key
      end
  end

  -- Fallback in case of floating point issues or empty pool somehow bypassing the check
  print("Warning: Weighted planet selection failed to pick, falling back.")
  return pool[#pool].key or default_key or 'c_pluto'
end

function level_up_hand_chips(card, hand, instant, amount)
    amount = amount or 1
    G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + amount)

    G.GAME.hands[hand].chips = math.max(0, G.GAME.hands[hand].chips + (G.GAME.hands[hand].l_chips * amount * 2))
    if not instant then 
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        update_hand_text({delay = 0}, {chips = G.GAME.hands[hand].chips, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = nil
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
        delay(1.3)
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function() check_for_unlock{type = 'upgrade_hand', hand = hand, level = G.GAME.hands[hand].level} return true end)
    }))
end

function level_up_hand_mult(card, hand, instant, amount)
    amount = amount or 1
    G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + amount)

    G.GAME.hands[hand].mult = math.max(1, G.GAME.hands[hand].mult + (G.GAME.hands[hand].l_mult * amount * 2))
    if not instant then 
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        update_hand_text({delay = 0}, {mult = G.GAME.hands[hand].mult, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
        delay(1.3)
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function() check_for_unlock{type = 'upgrade_hand', hand = hand, level = G.GAME.hands[hand].level} return true end)
    }))
end