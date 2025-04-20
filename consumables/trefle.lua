SMODS.Consumable {
	key = 'trefle',
	set = 'Spectral',
	pos = { x = 1, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = true,
	config = {},
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
	end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end,
	use = function(self, card, area, copier)

        if not G.jokers or #G.jokers.cards == 0 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.RED})
            return false 
        end

    
        local highest_rarity_val = 0
        local highest_rarity_is_legendary = false
        for _, joker in ipairs(G.jokers.cards) do
            local rarity = joker.config.center.rarity or 1 


            local numeric_rarity = tonumber(rarity) or 1 
            if numeric_rarity > highest_rarity_val then
                highest_rarity_val = numeric_rarity
                highest_rarity_is_legendary = (numeric_rarity == 4) 
            end
        end


        local candidates = {}
        for _, joker in ipairs(G.jokers.cards) do
            local rarity = joker.config.center.rarity or 1
            local numeric_rarity = tonumber(rarity) or 1
            if numeric_rarity == highest_rarity_val then
                table.insert(candidates, joker)
            end
        end

        local victim_joker = pseudorandom_element(candidates, pseudoseed('apex_swap_victim'))
        local victim_key = victim_joker.config.center.key


        local replacement_pool = {}
        for joker_key, center_data in pairs(G.P_CENTER_POOLS.Joker) do

            local current_rarity = center_data.rarity or 1
            local numeric_rarity = tonumber(current_rarity) or 1

            if numeric_rarity == highest_rarity_val then

                if center_data.key ~= victim_key then

                    if not center_data.demo and not center_data.wip and (center_data.unlocked or G.GAME.modifiers.all_jokers_unlocked) then
                        table.insert(replacement_pool, center_data.key)
                    end
                end
            end
        end


        local replacement_key = pseudorandom_element(replacement_pool, pseudoseed('apex_swap_replacement'))

        local victim_index
        for i, jkr in ipairs(G.jokers.cards) do
            if jkr == victim_joker then
                victim_index = i
                break
            end
        end


        local new_joker = create_card('Joker', G.jokers, highest_rarity_is_legendary, highest_rarity_val, true, nil, replacement_key, 'apex_swap')


        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1, 
            func = function()
                if victim_joker and not victim_joker.removed then
                    victim_joker:start_dissolve({G.C.SPECTRAL, G.C.WHITE})
                    victim_joker:remove_from_deck() 
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5, 
                        func = function()
                           if victim_joker.area then victim_joker.area:remove_card(victim_joker) end
                           return true
                        end
                    }))
                end
                if new_joker then
                    new_joker:add_to_deck()
                    if victim_index and victim_index <= #G.jokers.cards + 1 then
                        G.jokers:emplace(new_joker, victim_index)
                    else
                        G.jokers:emplace(new_joker)
                    end
                    new_joker:start_materialize({G.C.SPECTRAL, G.C.WHITE})
                end

                card:juice_up(0.5, 0.5)
                return true
            end
        }))

        return true
    end
	
}