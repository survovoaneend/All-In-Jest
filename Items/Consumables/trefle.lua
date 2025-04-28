local trefle_spectral = {
    object_type = "Consumable",
	key = 'trefle',
	set = 'Spectral',
	pos = { x = 1, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 0,
	config = {},
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'reroll_joker'}
	end,
    can_use = function(self, card)
      return G.jokers and #G.jokers.cards > 0  
    end,
    --thank you chatgpt i couldnt figure this out lmao
	use = function(self, card, area, copier)
        if not G.jokers or #G.jokers.cards == 0 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = 'No Jokers!', colour = G.C.RED})
            return false -- No jokers to swap
        end

        -- 1. Find the absolute highest rarity value among all Jokers
        local absolute_highest_rarity_val = 0
        for _, joker in ipairs(G.jokers.cards) do
            local rarity = joker.config.center.rarity or 1
            local numeric_rarity = tonumber(rarity) or 1
            if numeric_rarity > absolute_highest_rarity_val then
                absolute_highest_rarity_val = numeric_rarity
            end
        end

        -- 2. Find the highest *targetable* rarity (must have at least one non-eternal joker)
        local target_rarity_val = -1 -- Initialize to an invalid value
        local target_rarity_is_legendary = false -- Is the target rarity legendary?

        for current_rarity_check = absolute_highest_rarity_val, 1, -1 do
            local found_non_eternal_at_this_level = false
            local is_legendary_at_this_level = false -- Check specifically for this level
            for _, joker in ipairs(G.jokers.cards) do
                 local rarity = joker.config.center.rarity or 1
                 local numeric_rarity = tonumber(rarity) or 1

                 if numeric_rarity == current_rarity_check then
                    if not joker.ability.eternal then
                        found_non_eternal_at_this_level = true
                    end
                    -- Check if *any* joker at this level makes it legendary (rarity 4)
                    if numeric_rarity == 4 then
                       is_legendary_at_this_level = true
                    end
                 end
            end

            if found_non_eternal_at_this_level then
                target_rarity_val = current_rarity_check
                target_rarity_is_legendary = is_legendary_at_this_level -- Set based on the found target rarity
                break -- Found the highest targetable level, stop searching lower
            end
        end

        -- 3. If no non-eternal joker was found at any level
        if target_rarity_val == -1 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = 'All Jokers Eternal!', colour = G.C.FILTER})
            return false -- Cannot perform the swap
        end

        -- 4. Find candidates (non-eternal Jokers at the target rarity)
        local candidates = {}
        for _, joker in ipairs(G.jokers.cards) do
            local rarity = joker.config.center.rarity or 1
            local numeric_rarity = tonumber(rarity) or 1
            if numeric_rarity == target_rarity_val and not joker.ability.eternal then
                table.insert(candidates, joker)
            end
        end

        -- 5. Handle case where somehow no candidates were found (shouldn't happen if step 3 passed)
        if #candidates == 0 then
             card_eval_status_text(card, 'extra', nil, nil, nil, {message = 'Error: No valid target!', colour = G.C.RED})
             return false
        end

        -- 6. Select Victim from the non-eternal candidates
        local victim_joker = pseudorandom_element(candidates, pseudoseed('trefle_victim'))
        local victim_key = victim_joker.config.center.key

        -- 7. Build Replacement Pool (using the target_rarity_val)
        local replacement_pool = {}
        for _, center_data in ipairs(G.P_CENTER_POOLS.Joker) do -- Use ipairs for potentially better performance on arrays
            local current_rarity = center_data.rarity or 1
            local numeric_rarity = tonumber(current_rarity) or 1

            -- Only consider jokers of the *target* rarity
            if numeric_rarity == target_rarity_val then
                -- Make sure it's not the same as the victim
                if center_data.key ~= victim_key then
                    -- Check if unlocked (or if unlocks don't matter)
                    if not center_data.demo and not center_data.wip and (center_data.unlocked or G.GAME.modifiers.all_jokers_unlocked) then
                        -- Check if it's not excluded by pool function (if one exists)
                        local can_add = true
                        if center_data.in_pool and type(center_data.in_pool) == 'function' then
                             if not center_data:in_pool() then can_add = false end
                        end
                        if can_add then table.insert(replacement_pool, center_data.key) end
                    end
                end
            end
        end

        -- 8. Handle case where no replacement could be found
        if #replacement_pool == 0 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = 'No replacement found!', colour = G.C.RED})
            return false -- Cannot perform the swap
        end

        -- 9. Select Replacement
        local replacement_key = pseudorandom_element(replacement_pool, pseudoseed('trefle_replacement'))

        -- 10. Find victim's index for correct placement
        local victim_index
        for i, jkr in ipairs(G.jokers.cards) do
            if jkr == victim_joker then
                victim_index = i
                break
            end
        end

        -- 11. Create New Joker (using target_rarity_is_legendary and target_rarity_val)
        -- Pass the correct rarity value and legendary status for the *target* rarity tier
        local new_joker = create_card('Joker', G.jokers, target_rarity_is_legendary, target_rarity_val, true, nil, replacement_key, 'apex_swap')

        -- 12. Perform the swap animation/logic
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                if victim_joker and not victim_joker.removed then
                    -- Make sure eternal status isn't somehow reapplied before dissolve
                    victim_joker.ability.eternal = nil
                    victim_joker:start_dissolve({G.C.SPECTRAL, G.C.WHITE})
                    victim_joker:remove_from_deck(true) -- Use true to bypass normal removal logic if needed
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5,
                        func = function()
                           -- Ensure it's removed from the area *after* dissolve starts visually
                           if victim_joker and victim_joker.area then victim_joker.area:remove_card(victim_joker) end
                           return true
                        end
                    }))
                end
                if new_joker then
                    new_joker:add_to_deck()
                    if victim_index and victim_index <= #G.jokers.cards + 1 then
                        G.jokers:emplace(new_joker, victim_index)
                    else
                        G.jokers:emplace(new_joker) -- Fallback if index is weird
                    end
                    new_joker:start_materialize({G.C.SPECTRAL, G.C.WHITE})
                end

                card:juice_up(0.5, 0.5)
                return true
            end
        }))

        return true -- Indicate success
end
}
return {name = {"Spectrals"}, items = {trefle_spectral}}