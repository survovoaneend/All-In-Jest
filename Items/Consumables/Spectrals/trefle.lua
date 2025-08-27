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
        info_queue[#info_queue + 1] = { set = 'Other', key = 'reroll_joker' }
    end,
    can_use = function(self, card)
       
        if G.jokers.highlighted and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] and not G.jokers.highlighted[1].ability["eternal"] then
            local target = G.jokers.highlighted[1]
            if target.ability.set == 'Joker' and not target.ability.eternal and target.area == G.jokers then
                return true
            end
        end
        return false
    end,

    
    use = function(self, card, area, copier)
      
        local victim_joker = G.jokers.highlighted[1]
      
        local victim_rarity = victim_joker.config.center.rarity or 1
        local is_legendary = victim_rarity == 4
        local victim_key = victim_joker.config.center.key

    
        local replacement_pool = {}
        for _, center_data in ipairs(G.P_CENTER_POOLS.Joker) do
            local current_rarity = center_data.rarity or 1
            if current_rarity == victim_rarity then
                if center_data.key ~= victim_key then
                    if not center_data.demo and not center_data.wip and (center_data.unlocked or G.GAME.modifiers.all_jokers_unlocked or center_data.rarity == 4) then
                        local can_add = true
                        if center_data.in_pool and type(center_data.in_pool) == 'function' then
                            if not center_data:in_pool() then can_add = false end
                        end
                        if can_add then table.insert(replacement_pool, center_data.key) end
                    end
                end
            end
        end

      
        if #replacement_pool == 0 then
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'No replacement found!', colour = G.C.RED })
            return false
        end

    
        local replacement_key = pseudorandom_element(replacement_pool, pseudoseed('trefle_replacement'))
        local victim_index
        for i, jkr in ipairs(G.jokers.cards) do
            if jkr == victim_joker then
                victim_index = i
                break
            end
        end

    
        G.hand:unhighlight_all()

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                if victim_joker and not victim_joker.removed then
                    victim_joker:start_dissolve({ G.C.SPECTRAL, G.C.WHITE })
                    victim_joker:remove_from_deck(true)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5,
                        func = function()
                            if victim_joker and victim_joker.area then victim_joker.area:remove_card(victim_joker) end
                            return true
                        end
                    }))
                end

                local new_joker = create_card('Joker', G.jokers, is_legendary, victim_rarity, true, nil,
                    replacement_key, 'apex_swap')
                if new_joker then
                    new_joker:add_to_deck()
                    if victim_index and victim_index <= #G.jokers.cards + 1 then
                        G.jokers:emplace(new_joker, victim_index)
                    else
                        G.jokers:emplace(new_joker)
                    end
                    for k, v in pairs(G.shared_stickers) do
                        if victim_joker.ability[k] then
                            new_joker.ability[k] = true
                            -- ensure perish_tally is initialized correctly
                            if k == "perishable" and new_joker.ability.perish_tally == nil then
                                new_joker.ability.perish_tally = G.GAME.perishable_rounds or 5
                            end
                        end
                    end
                    
                    new_joker:start_materialize({ G.C.SPECTRAL, G.C.WHITE })
                    new_joker:set_edition(victim_joker.edition)
                end

                card:juice_up(0.5, 0.5)
                return true
            end
        }))

        return true 
    end
}
return { name = { "Spectrals" }, items = { trefle_spectral } }