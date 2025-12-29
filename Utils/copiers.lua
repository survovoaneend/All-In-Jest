table.unpack = table.unpack or unpack -- Latest lua replaces unpack with table.unpack, Balatro uses older lua
-- Old lua does not have a reverse to unpack, this implements a workaround
table.pack = table.pack or function (args)
    return { args }
end

-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
-- A set of utility functions used for new jokers that copy joker abilities without the other joker being owned
-- Currently: Joker.png, Czar
-- Planned: What's Left (formerly Visage), Clay Joker 
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local save_changed_abilities_to_stored_table = function (copier_card, copied_index)
    copied_index = tonumber(copied_index)
    for k, v in pairs(copier_card.ability) do
        if not (k == copier_card.config.center.key or k == "jest_applied" or string.sub(k, 1, #"j_aij_whats_left_compat") == "j_aij_whats_left_compat") then -- This is the key that stores all the data related to the copier joker
            -- if copier_card.ability[copier_card.config.center.key].copied_joker_abilities[copied_index][k] ~= v and type(v) ~= "table" then
            --     sendDebugMessage("Saving " .. tostring(copier_card.ability[copier_card.config.center.key].copied_joker_abilities[copied_index][k] or "nil") .. " to " .. tostring(v or "nil"), "AiJ")
            -- end
            if type(v) == "table" then
                copier_card.ability[copier_card.config.center.key].copied_joker_abilities[copied_index][k] = copy_table(v)
            else
                copier_card.ability[copier_card.config.center.key].copied_joker_abilities[copied_index][k] = v
            end
        end
    end
end

local handle_vanilla_joker_abilities = function (copier_card, center_to_copy, ability_table, copied_base_stats)
    if center_to_copy.name == "Invisible Joker" then 
        ability_table.invis_rounds = copied_base_stats.invis_rounds or 0
    end
    if center_to_copy.name == 'To Do List' then
        if copied_base_stats.to_do_poker_hand then
            ability_table.to_do_poker_hand = copied_base_stats.to_do_poker_hand
        else
            local _poker_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(k) then _poker_hands[#_poker_hands+1] = k end
            end
            local old_hand = ability_table.to_do_poker_hand
            ability_table.to_do_poker_hand = nil

            while not ability_table.to_do_poker_hand do
                ability_table.to_do_poker_hand = pseudorandom_element(_poker_hands, pseudoseed((copier_card.area and copier_card.area.config.type == 'title') and 'false_to_do' or 'to_do'))
                if ability_table.to_do_poker_hand == old_hand then ability_table.to_do_poker_hand = nil end
            end
        end
    end
    if center_to_copy.name == 'Caino' then 
        ability_table.caino_xmult = copied_base_stats.caino_xmult or 1
    end
    if center_to_copy.name == 'Yorick' then 
        ability_table.yorick_discards = copied_base_stats.yorick_discards or ability_table.extra.discards
    end
    if center_to_copy.name == 'Loyalty Card' then 
        ability_table.burnt_hand = 0
        ability_table.loyalty_remaining = copied_base_stats.loyalty_remaining or ability_table.extra.every
    end
end

-- Gives the copier joker the ability attributes of the card its copying
-- Includes some hard-coded vanilla stuff, cannot do the same for modded jokers as set_ability also handles sprites.
-- Note card vs center - card is the individual card object that renders in the game, center is the data stored in G.P_CENTERS and is not attached to an individual joker
All_in_Jest.set_copied_ability = function(copier_card, center_to_copy, ability_table, copied_base_stats)
    -- If the copier joker is copying multiple jokers at once,
    -- move the old ability to its respective ability table
    local old_ability = copier_card.ability
    if old_ability.copied_joker_abilities_index ~= nil then
        save_changed_abilities_to_stored_table(copier_card, old_ability.copied_joker_abilities_index)
    end

    ability_table = ability_table or copier_card.ability
    copied_base_stats = copied_base_stats or center_to_copy.config

    local new_ability = {
        -- name = center_to_copy.name or copier_card.config.center.name,
        -- effect = center_to_copy.effect,
        -- set = center_to_copy.set,
        mult = copied_base_stats.mult or 0,
        h_mult = copied_base_stats.h_mult or 0,
        h_x_mult = copied_base_stats.h_x_mult or 0,
        h_dollars = copied_base_stats.h_dollars or 0,
        p_dollars = copied_base_stats.p_dollars or 0,
        t_mult = copied_base_stats.t_mult or 0,
        t_chips = copied_base_stats.t_chips or 0,
        x_mult = copied_base_stats.Xmult or copied_base_stats.x_mult or 1,
        h_chips = copied_base_stats.h_chips or 0,
        x_chips = copied_base_stats.x_chips or 1,
        h_x_chips = copied_base_stats.h_x_chips or 1,
        repetitions = copied_base_stats.repetitions or 0,
        h_size = copied_base_stats.h_size or 0,
        d_size = copied_base_stats.d_size or 0,
        extra = copy_table(copied_base_stats.extra) or "nil",
        -- extra_value = 0,
        type = copied_base_stats.type or '',
        forced_selection = ability_table and ability_table.forced_selection or "nil",
        perma_bonus = ability_table and ability_table.perma_bonus or 0,
        perma_x_chips = ability_table and ability_table.perma_x_chips or 0,
        perma_mult = ability_table and ability_table.perma_mult or 0,
        perma_x_mult = ability_table and ability_table.perma_x_mult or 0,
        perma_h_chips = ability_table and ability_table.perma_h_chips or 0,
        perma_h_x_chips = ability_table and ability_table.perma_h_x_chips or 0,
        perma_h_mult = ability_table and ability_table.perma_h_mult or 0,
        perma_h_x_mult = ability_table and ability_table.perma_h_x_mult or 0,
        perma_p_dollars = ability_table and ability_table.perma_p_dollars or 0,
        perma_h_dollars = ability_table and ability_table.perma_h_dollars or 0,
        perma_repetitions = ability_table and ability_table.perma_repetitions or 0,
        card_limit = ability_table and ability_table.card_limit or 0,
        extra_slots_used = ability_table and ability_table.extra_slots_used or 0,
    }

    ability_table.extra_value = ability_table.extra_value or 0
    for k, v in pairs(new_ability) do
        if v == "nil" then
            ability_table[k] = nil
        else
            ability_table[k] = v
        end
    end
    ability_table.aij_blueprint_compat = center_to_copy.blueprint_compat
    ability_table.aij_dongtong_compat = center_to_copy.dongtong_compat
    local compatible = center_to_copy[copier_card.config.center.key .. "_compat"] ~= false
    ability_table[copier_card.config.center.key .. "_compat"] = (compatible and "compatible") or "incompatible"
    ability_table.copied_joker_abilities_index = nil
    -- ability_table.jest_applied = nil
    
    for k, v in pairs(copied_base_stats) do
        if k ~= 'bonus' then
            if type(v) == 'table' then
                ability_table[k] = copy_table(v)
            else
                ability_table[k] = v
            end
        end
    end

    handle_vanilla_joker_abilities(copier_card, center_to_copy, ability_table, copied_base_stats)

    return true
end

-- Used for copier jokers that copy multiple jokers at once from a pool
-- Swaps in a joker ability from their "copied_joker_abilities" table
All_in_Jest.hotswap_copied_ability = function(copier_card, index)
    local new_ability = copier_card.ability[copier_card.config.center.key].copied_joker_abilities[index]
    -- if G.P_CENTERS[new_ability.key][copier_card.config.center.key .. "_compat"] ~= false then
        local original_jest_applied = copy_table(copier_card.ability.jest_applied)
        All_in_Jest.set_copied_ability(copier_card, G.P_CENTERS[new_ability.key], nil, new_ability)
        copier_card.ability.jest_applied = original_jest_applied
        new_ability.copied_joker_abilities_index = tostring(index) -- Make this a string so dongtong doesn't affect it
    -- end
end

-- Function to insert into the queue at a specific index
-- Used to insert events before any events created by a function (usually calculate)
local function event_insert_to_queue(manager, index, event, queue)
    queue = queue or 'base'
    if event:is(Event) then
        table.insert(manager.queues[queue], math.min(index, #manager.queues[queue] + 1), event)
    end
end

-- A boilerplate function that lets a copier joker use one of the methods of the joker its copying
-- Vanilla jokers are implemented differently, and so are handled seperately
All_in_Jest.use_copied_joker_function = function(card, modded_func_name, vanilla_func_name, modded_func_args, vanilla_func_args, index, skip_events)
    if vanilla_func_name == nil then
        vanilla_func_args = modded_func_args
    end
    vanilla_func_name = vanilla_func_name or modded_func_name
    local to_copy = nil
    if card.ability[card.config.center.key].copied_joker_abilities and card.ability[card.config.center.key].copied_joker_abilities[index] then
        to_copy = card.ability[card.config.center.key].copied_joker_abilities[index].key
    else
        to_copy = card.ability[card.config.center.key].copied_joker_key
    end
    if to_copy ~= nil then
        local obj = G.P_CENTERS[to_copy]

        if obj[card.config.center.key .. "_compat"] == false then
            return {}
        end

        if index ~= nil then
            All_in_Jest.hotswap_copied_ability(card, index)
        end

        local starting_queue_length = #G.E_MANAGER.queues.base

        -- if not skip_events then
        --     sendDebugMessage(starting_queue_length .. modded_func_name .. pseudorandom(pseudoseed("AIJ")), "AIJ use")
        -- end

        local ret = table.pack(nil)
        if obj[modded_func_name] and type(obj[modded_func_name]) == 'function' then
            -- Modded Jokers
            ret = table.pack(obj[modded_func_name](obj, table.unpack(modded_func_args)))
        else
            -- Vanilla Jokers
            local old_func = card.config.center[modded_func_name]
            card.ability.name = obj.name
            card.config.center[modded_func_name] = nil

            ret = table.pack(card[vanilla_func_name](card, table.unpack(vanilla_func_args)))

            card.ability.name = card.config.center.name
            card.config.center[modded_func_name] = old_func
        end

        -- if not skip_events then
        --     sendDebugMessage(#G.E_MANAGER.queues.base .. " " .. starting_queue_length .. modded_func_name .. "bblurb", "AIJ use")
        -- end
        if index ~= nil then
            if not skip_events and (#G.E_MANAGER.queues.base > starting_queue_length) then
                -- sendDebugMessage("Events" .. tprint(modded_func_args), "AIJ")
                All_in_Jest.set_copied_ability(card, {config = {}})
                -- Repeat set_copied_ability in events so that any events the copied joker creates can reference itself correctly
                -- Using two-deep events, could go deeper if needed
                local expected_queue_length = #G.E_MANAGER.queues.base
                event_insert_to_queue(G.E_MANAGER, starting_queue_length + 1, Event({
                    func = function()
                        expected_queue_length = #G.E_MANAGER.queues.base - (expected_queue_length - starting_queue_length) - 1
                        sendDebugMessage(expected_queue_length .. modded_func_name .. pseudorandom(pseudoseed("AIJ")), "AIJ use")
                        All_in_Jest.hotswap_copied_ability(card, index)
                        return true
                    end
                }))
                -- Any events made when calling modded_func_name() or vanilla_func_name() above will execute here
                -- This will not include any events made when ret is returned
                -- Will include card_eval_status_text(), attention_text(), and similar. Would be ideal if these are moved to return parameters
                G.E_MANAGER:add_event(Event({
                    func = function()
                        sendDebugMessage(#G.E_MANAGER.queues.base .. " " .. expected_queue_length .. modded_func_name .. "bblurb" .. index, "AIJ use")
                        -- Check if any events were created between this event and the previously inserted one
                        -- If none were, #G.E_MANAGER.queues.base should be equal to the expected_queue_length
                        -- If it's greater than expected_queue_length, then additional events have been made
                        -- (If it's somehow less something weird happened)
                        if (not skip_events) and (#G.E_MANAGER.queues.base > expected_queue_length) then -- Subtract 1 from starting_queue_length to account for the event inserted above
                            -- This is for events that modify joker values nested in an event
                            -- I don't think there yet exists a joker in this mod that does this?
                            -- This is mostly a "just-in-case" measure, especially for modded and future effects
                            All_in_Jest.set_copied_ability(card, {config = {}})
                            event_insert_to_queue(G.E_MANAGER, expected_queue_length, Event({
                                func = function()
                                    sendDebugMessage(modded_func_name .. pseudorandom(pseudoseed("AIJ")), "AIJ use")
                                    All_in_Jest.hotswap_copied_ability(card, index)
                                    return true
                                end
                            }))
                            -- Any events made in the events when calling modded_func_name() or vanilla_func_name() above will execute here
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    sendDebugMessage(modded_func_name .. "bblurb" .. index, "AIJ use")
                                    All_in_Jest.set_copied_ability(card, {config = {}})
                                    return true
                                end
                            }))
                        end
                        return true
                    end
                }))
            end
        end

        return ret
    end
end

-- Sets a copier joker to copy a specified joker
-- Keep index as nil if copier only copies one joker at a time
All_in_Jest.set_copied_joker = function(copier_card, copied_center)
    -- Set added_to_deck before and after as remove_from_deck does not execute if card is not added to deck
    copier_card.added_to_deck = true
    All_in_Jest.use_copied_joker_function(copier_card, "remove_from_deck", "remove_from_deck", {copier_card, true}, {true})
    copier_card.added_to_deck = true

    if copied_center == nil or (not copied_center.key) then
        copied_center = G.P_CENTERS['j_joker']
    end
    All_in_Jest.set_copied_ability(copier_card, copied_center)
    if copier_card.aij_dongtong_compat then
        jest_ability_calculate(
            copier_card,
            "*", (copier_card.ability[copier_card.config.center.key].silver_multiplier_buff or 100) / 100,
            { x_chips = 1, x_mult = 1, extra_value = true, rarity = true, [copier_card.config.center.key] = true },
            nil, true, nil, "ability"
        )
    end

    local joker_key = copied_center.key
    copier_card.ability[copier_card.config.center.key].copied_joker_key = joker_key

    local copier_ability = copy_table(copier_card.ability[copier_card.config.center.key])
    
    copier_card.ability[copier_card.config.center.key] = copier_ability

    -- Set added_to_deck before and after as add_to_deck does not execute if card is already added to deck
    copier_card.added_to_deck = false
    All_in_Jest.use_copied_joker_function(copier_card, "add_to_deck", "add_to_deck", {copier_card, true}, {true})
    copier_card.added_to_deck = true
end

All_in_Jest.add_copied_joker = function(copier_card, copied_center, copied_base_stats, skip_funcs)
    if copier_card.ability[copier_card.config.center.key].copied_joker_abilities ~= nil then
        if copied_center == nil or (not copied_center.key) then
            copied_center = G.P_CENTERS['j_joker']
        end
        if copied_center.key ~= nil and copied_center.key ~= copier_card.config.center.key then
            local new_ability = {}

            if copied_center[copier_card.config.center.key .. "_compat"] == false then
                copied_base_stats = nil -- Do not save incompatible joker abilities
            end
            All_in_Jest.set_copied_ability(copier_card, copied_center, new_ability, copied_base_stats)
            local joker_key = copied_center.key
            new_ability.key = joker_key

            if copied_center.aij_dongtong_compat then
                jest_ability_calculate(
                    {ability = new_ability},
                    "*", (copier_card.ability[copier_card.config.center.key].silver_multiplier_buff or 100) / 100,
                    { x_chips = 1, x_mult = 1, extra_value = true, rarity = true, [copier_card.config.center.key] = true },
                    nil, true, nil, "ability"
                )
            end

            table.insert(copier_card.ability[copier_card.config.center.key].copied_joker_abilities, new_ability)

            if not skip_funcs and #copier_card.ability[copier_card.config.center.key].copied_joker_abilities > copier_card.ability[copier_card.config.center.key].copy_limit then
                local index = #copier_card.ability[copier_card.config.center.key].copied_joker_abilities - copier_card.ability[copier_card.config.center.key].copy_limit
                All_in_Jest.hotswap_copied_ability(copier_card, index)
                copier_card.added_to_deck = true
                All_in_Jest.use_copied_joker_function(copier_card, "remove_from_deck", "remove_from_deck", {copier_card, true}, {true}, index)
                copier_card.added_to_deck = true
                All_in_Jest.set_copied_ability(copier_card, {config = {}})
            end

            local copier_ability = copy_table(copier_card.ability[copier_card.config.center.key])
            copier_card.ability[copier_card.config.center.key] = copier_ability

            -- Set added_to_deck before and after as add_to_deck does not execute if card is already added to deck
            if not (skip_funcs or copied_center[copier_card.config.center.key .. "_compat"] == false) then
                All_in_Jest.hotswap_copied_ability(copier_card, #copier_card.ability[copier_card.config.center.key].copied_joker_abilities)
                copier_card.added_to_deck = false
                All_in_Jest.use_copied_joker_function(copier_card, "add_to_deck", "add_to_deck", {copier_card, true}, {true}, #copier_card.ability[copier_card.config.center.key].copied_joker_abilities)
                copier_card.added_to_deck = true
                All_in_Jest.set_copied_ability(copier_card, {config = {}})
            end
        end
    end
end