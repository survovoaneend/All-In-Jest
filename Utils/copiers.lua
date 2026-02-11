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
        if not (
            k == copier_card.config.center.key or 
            k == "jest_applied" or 
            k == "jest_silver_active" or
            k == "name" or
            k == "key" or
            string.sub(k, 1, #(copier_card.config.center.key .. "compat")) == copier_card.config.center.key .. "compat" or
            SMODS.Stickers[k] ~= nil
        ) then -- This is the key that stores all the data related to the copier joker
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
    local compatible = center_to_copy[copier_card.config.center.key .. "_compat"] ~= false
    ability_table[copier_card.config.center.key .. "_compat"] = (compatible and "compatible") or "incompatible"
    ability_table.copied_joker_abilities_index = nil
    -- ability_table.jest_applied = nil
    
    for k, v in pairs(copied_base_stats) do
        if not (
            k == 'bonus' or
            k == 'name' or
            k == 'key' or
            SMODS.Stickers[k] ~= nil
        ) then
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
    local original_jest_applied = copy_table(copier_card.ability.jest_applied)
    All_in_Jest.set_copied_ability(copier_card, G.P_CENTERS[new_ability.key], nil, new_ability)
    copier_card.ability.jest_applied = original_jest_applied
    new_ability.copied_joker_abilities_index = tostring(index) -- Make this a string so dongtong doesn't affect it
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
-- Vanilla jokers are implemented differently, and so are handled separately
All_in_Jest.use_copied_joker_function = function(card, modded_func_name, vanilla_func_name, modded_func_args, vanilla_func_args, index, skip_events)
    if card.ability.name ~= card.config.center.key then
        return {}
    end
    if not card.ability[card.config.center.key] then
        return {}
    end

    if vanilla_func_name == nil then
        vanilla_func_args = modded_func_args
    end
    vanilla_func_name = vanilla_func_name or modded_func_name
    local to_copy = nil
    if card.ability[card.config.center.key].copied_joker_abilities and card.ability[card.config.center.key].copied_joker_abilities[index] then
        to_copy = card.ability[card.config.center.key].copied_joker_abilities[index].key
    elseif card.ability[card.config.center.key].copied_joker_key ~= nil then
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

        local ret = table.pack(nil)
        if obj[modded_func_name] and type(obj[modded_func_name]) == 'function' then
            -- Modded Jokers
            ret = table.pack(obj[modded_func_name](obj, table.unpack(modded_func_args)))
        else
            -- Vanilla Jokers
            card.ability.name = obj.name
            ret = table.pack(Card[vanilla_func_name](card, table.unpack(vanilla_func_args)))
            card.ability.name = card.config.center.name
        end

        if index ~= nil then
            if not skip_events and (#G.E_MANAGER.queues.base > starting_queue_length) then
                All_in_Jest.set_copied_ability(card, {config = {}})
                -- Repeat set_copied_ability in events so that any events the copied joker creates can reference itself correctly
                -- Using two-deep events, could go deeper if needed
                local expected_queue_length = #G.E_MANAGER.queues.base
                event_insert_to_queue(G.E_MANAGER, starting_queue_length + 1, Event({
                    func = function()
                        expected_queue_length = #G.E_MANAGER.queues.base - (expected_queue_length - starting_queue_length) - 1
                        All_in_Jest.hotswap_copied_ability(card, index)
                        return true
                    end
                }))
                -- Any events made when calling modded_func_name() or vanilla_func_name() above will execute here
                -- This will not include any events made when ret is returned
                -- Will include card_eval_status_text(), attention_text(), and similar. Would be ideal if these are moved to return parameters
                G.E_MANAGER:add_event(Event({
                    func = function()
                        -- Check if any events were created between this event and the previously inserted one
                        -- If none were, #G.E_MANAGER.queues.base should be equal to the expected_queue_length
                        -- If it's greater than expected_queue_length, then additional events have been made
                        -- (If it's somehow less something weird happened)
                        if not skip_events then
                            All_in_Jest.set_copied_ability(card, {config = {}})
                        end
                        if (not skip_events) and (#G.E_MANAGER.queues.base > expected_queue_length) then -- Subtract 1 from starting_queue_length to account for the event inserted above
                            -- This is for events that modify joker values nested in an event
                            -- I don't think there yet exists a joker in this mod that does this?
                            -- This is mostly a "just-in-case" measure, especially for modded and future effects
                            event_insert_to_queue(G.E_MANAGER, expected_queue_length + 1, Event({
                                func = function()
                                    All_in_Jest.hotswap_copied_ability(card, index)
                                    return true
                                end
                            }))
                            -- Any events made in the events when calling modded_func_name() or vanilla_func_name() above will execute here
                            G.E_MANAGER:add_event(Event({
                                func = function()
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
-- Joker.png + Czar
All_in_Jest.set_copied_joker = function(copier_card, copied_center)
    -- Set added_to_deck before and after as remove_from_deck does not execute if card is not added to deck
    if copier_card.ability[copier_card.config.center.key].copied_joker_key ~= nil then
        copier_card.added_to_deck = true
        All_in_Jest.use_copied_joker_function(copier_card, "remove_from_deck", "remove_from_deck", {copier_card, true}, {true})
        copier_card.added_to_deck = true
    end

    if copied_center == nil or (not copied_center.key) then
        copied_center = G.P_CENTERS['j_joker']
    end
    All_in_Jest.set_copied_ability(copier_card, copied_center)
    if copied_center.dongtong_compat ~= false then
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

-- Adds a joker for a multi-copier joker to copy
-- What's Left + Clay Joker
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
            new_ability.key = copied_center.key
            new_ability.name = copied_center.name
            new_ability.jest_silver_active = nil
            new_ability.aij_recherche_doubled = nil
            new_ability.aij_unusual_doubled = nil

            -- Apply ability multipliers (silver, recherche)
            -- Do not apply dongtong as it is likely already applied
            if copied_center.dongtong_compat ~= false then
                jest_ability_calculate(
                    {ability = new_ability},
                    "*", (copier_card.ability[copier_card.config.center.key].silver_multiplier_buff or 100) / 100 / (2 ^ (new_ability.jest_applied and new_ability.jest_applied.j_aij_dongtong or 0)),
                    { x_chips = 1, x_mult = 1, extra_value = true, rarity = true, [copier_card.config.center.key] = true },
                    nil, true, nil, "ability"
                )
            end

            table.insert(copier_card.ability[copier_card.config.center.key].copied_joker_abilities, new_ability)

            if not skip_funcs and #copier_card.ability[copier_card.config.center.key].copied_joker_abilities > copier_card.ability[copier_card.config.center.key].copy_limit then
                local index = #copier_card.ability[copier_card.config.center.key].copied_joker_abilities - copier_card.ability[copier_card.config.center.key].copy_limit
                local center_to_copy = G.P_CENTERS[copier_card.ability[copier_card.config.center.key].copied_joker_abilities[index].key]
                if center_to_copy[copier_card.config.center.key .. "_compat"] ~= false then
                    All_in_Jest.hotswap_copied_ability(copier_card, index)
                    copier_card.added_to_deck = true
                    All_in_Jest.use_copied_joker_function(copier_card, "remove_from_deck", "remove_from_deck", {copier_card, true}, {true}, index)
                    copier_card.added_to_deck = true
                    All_in_Jest.set_copied_ability(copier_card, {config = {}})
                end
            end

            local copier_ability = copy_table(copier_card.ability[copier_card.config.center.key])
            copier_card.ability[copier_card.config.center.key] = copier_ability

            -- Set added_to_deck before and after as add_to_deck does not execute if card is already added to deck
            if not (skip_funcs or copied_center[copier_card.config.center.key .. "_compat"] == false) then
                if copied_center[copier_card.config.center.key .. "_compat"] ~= false then
                    All_in_Jest.hotswap_copied_ability(copier_card, #copier_card.ability[copier_card.config.center.key].copied_joker_abilities)
                    copier_card.added_to_deck = false
                    All_in_Jest.use_copied_joker_function(copier_card, "add_to_deck", "add_to_deck", {copier_card, true}, {true}, #copier_card.ability[copier_card.config.center.key].copied_joker_abilities)
                    copier_card.added_to_deck = true
                    All_in_Jest.set_copied_ability(copier_card, {config = {}})
                end
            end
        end
    end
end


-- ------------------------------------------------------------
-- Create template object for copier jokers
-- ------------------------------------------------------------


All_in_Jest.single_copier = SMODS.Joker:extend {
    add_to_deck = function(self, card, from_debuff)
        card.added_to_deck = false
        All_in_Jest.use_copied_joker_function(card, "add_to_deck", "add_to_deck", {card, true}, {true})
        card.added_to_deck = true
    end,

    remove_from_deck = function(self, card, from_debuff)
        card.added_to_deck = true
        All_in_Jest.use_copied_joker_function(card, "remove_from_deck", "remove_from_deck", {card, true}, {true})
        card.added_to_deck = true
    end,

    update = function(self, card, dt)
        All_in_Jest.use_copied_joker_function(card, "update", "update", {card, dt}, {dt})
    end,

    loc_vars = function(self, info_queue, card)
        if card.ability[card.config.center.key] and card.ability[card.config.center.key].copied_joker_key ~= nil then
            local copied_center = G.P_CENTERS[card.ability[card.config.center.key].copied_joker_key]
            local info_queue_center = { -- Create a simplified "fake" center that can be used without referencing/modifying the actual center object
                key = copied_center.key,
                name = copied_center.name,
                area = card.area,
                config = copied_center.config,
                blueprint_compat = copied_center.blueprint_compat,
                discovered = true,
                set = "Joker",
                create_fake_card = copied_center.create_fake_card,
                generate_ui = copied_center.generate_ui,
                loc_vars = copied_center.loc_vars
            }

            local other_vars = {}
            if copied_center.loc_vars then
                local ret = copied_center:loc_vars({}, card) -- Make info_queue an empty table 
                if ret then
                    other_vars = ret.vars
                end
            else
                card.ability.name = copied_center.name
                other_vars, _, _ = card:generate_UIBox_ability_table(true)
                card.ability.name = card.config.center.name
            end
            if other_vars then
                info_queue_center.specific_vars = other_vars
                info_queue_center.specific_vars.aij_copier_card = card
            end
            info_queue[#info_queue + 1] = info_queue_center
        end
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        -- Make blueprint compatibility work
        if context.blueprint and not G.P_CENTERS[card.ability[card.config.center.key].copied_joker_key].blueprint_compat then
            return {}
        end
        return table.unpack(All_in_Jest.use_copied_joker_function(card, "calculate", "calculate_joker", {card, context}, {context}))
    end,

    calc_dollar_bonus = function(self, card)
        return table.unpack(All_in_Jest.use_copied_joker_function(card, "calc_dollar_bonus", "calculate_dollar_bonus", {card}, {}))
    end
}

All_in_Jest.multi_copier = SMODS.Joker:extend {
    add_to_deck = function(self, card, from_debuff)
        if card.ability[card.config.center.key] and card.ability[card.config.center.key].copied_joker_abilities and #card.ability[card.config.center.key].copied_joker_abilities > 0 and card.ability.name == card.config.center.key then
            for index = #card.ability[card.config.center.key].copied_joker_abilities, math.max(1, #card.ability[card.config.center.key].copied_joker_abilities - card.ability[card.config.center.key].copy_limit + 1), -1 do
                local center_to_copy = G.P_CENTERS[card.ability[card.config.center.key].copied_joker_abilities[index].key]
                if center_to_copy[card.config.center.key .. "_compat"] ~= false then
                    card.added_to_deck = false
                    All_in_Jest.use_copied_joker_function(card, "add_to_deck", "add_to_deck", {card, true}, {true}, index)
                    card.added_to_deck = true
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability[card.config.center.key] and card.ability[card.config.center.key].copied_joker_abilities and #card.ability[card.config.center.key].copied_joker_abilities > 0 and card.ability.name == card.config.center.key then
            for index = #card.ability[card.config.center.key].copied_joker_abilities, math.max(1, #card.ability[card.config.center.key].copied_joker_abilities - card.ability[card.config.center.key].copy_limit + 1), -1 do
                local center_to_copy = G.P_CENTERS[card.ability[card.config.center.key].copied_joker_abilities[index].key]
                if center_to_copy[card.config.center.key .. "_compat"] ~= false then
                    card.added_to_deck = false
                    All_in_Jest.use_copied_joker_function(card, "remove_from_deck", "remove_from_deck", {card, true}, {true}, index)
                    card.added_to_deck = true
                end
            end
        end
    end,

    update = function(self, card, dt)
        if card.ability[card.config.center.key] and card.ability[card.config.center.key].copied_joker_abilities and #card.ability[card.config.center.key].copied_joker_abilities > 0 and card.ability.name == card.config.center.key then
            for index = #card.ability[card.config.center.key].copied_joker_abilities, math.max(1, #card.ability[card.config.center.key].copied_joker_abilities - card.ability[card.config.center.key].copy_limit + 1), -1 do
                local center_to_copy = G.P_CENTERS[card.ability[card.config.center.key].copied_joker_abilities[index].key]
                if center_to_copy[card.config.center.key .. "_compat"] ~= false then
                    All_in_Jest.use_copied_joker_function(card, "update", "update", {card, dt}, {dt}, index, true)
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local abilities_to_display = {}

        if card.ability[card.config.center.key] and card.ability[card.config.center.key].copied_joker_abilities and #card.ability[card.config.center.key].copied_joker_abilities > 0 then
            abilities_to_display = card.ability[card.config.center.key].copied_joker_abilities
        end

        if #abilities_to_display > 0 then
            for i = #abilities_to_display, math.max(1, #abilities_to_display - card.ability[card.config.center.key].copy_limit + 1), -1 do
                local center_key = abilities_to_display[i].key
                local copied_center = G.P_CENTERS[center_key]

                local info_queue_center = { -- Create a simplified "fake" center that can be used without referencing/modifying the actual center object
                    key = copied_center.key,
                    name = copied_center.name,
                    area = card.area,
                    config = copied_center.config,
                    blueprint_compat = copied_center.blueprint_compat,
                    discovered = true,
                    set = "Joker",
                    create_fake_card = copied_center.create_fake_card,
                    generate_ui = copied_center.generate_ui,
                    loc_vars = copied_center.loc_vars
                }

                local other_vars = {}
                if card.added_to_deck and copied_center[card.config.center.key .. "_compat"] ~= false then
                    All_in_Jest.hotswap_copied_ability(card, i)
                elseif copied_center[card.config.center.key .. "_compat"] ~= false then
                    All_in_Jest.set_copied_ability(card, copied_center, nil, abilities_to_display[i])
                else
                    All_in_Jest.set_copied_ability(card, copied_center)
                end
                if copied_center.loc_vars then
                    local ret = copied_center:loc_vars({}, card) -- Make info_queue an empty table 
                    if ret then
                        other_vars = ret.vars
                    end
                else
                    card.ability.name = copied_center.name
                    other_vars, main_start, main_end = card:generate_UIBox_ability_table(true)
                    card.ability.name = card.config.center.name
                end
                if other_vars then
                    info_queue_center.specific_vars = other_vars
                    info_queue_center.specific_vars.aij_multi_copier_card = card
                    info_queue_center.specific_vars.aij_multi_copier_card_index = i
                    info_queue_center.specific_vars.aij_multi_copier_card_ability = abilities_to_display[i]
                end
                info_queue[#info_queue + 1] = info_queue_center
                All_in_Jest.set_copied_ability(card, {config = {}})
            end
        end
        return { vars = { } }
    end,

    calculate = function(self, card, context)        
        if card.ability[card.config.center.key] and card.ability[card.config.center.key].copied_joker_abilities and #card.ability[card.config.center.key].copied_joker_abilities > 0 and card.ability.name == card.config.center.key then
            local return_table = nil
            for index = #card.ability[card.config.center.key].copied_joker_abilities, math.max(1, #card.ability[card.config.center.key].copied_joker_abilities - card.ability[card.config.center.key].copy_limit + 1), -1 do
                local center_to_copy = G.P_CENTERS[card.ability[card.config.center.key].copied_joker_abilities[index].key]
                if center_to_copy[card.config.center.key .. "_compat"] ~= false then
                    local new_ability = card.ability[card.config.center.key].copied_joker_abilities[index]
                    -- Make blueprint compatibility work
                    if card.config.center.key ~= new_ability.key and not (context.blueprint and not G.P_CENTERS[new_ability.key].blueprint_compat) then
                        local ret = table.unpack(All_in_Jest.use_copied_joker_function(card, "calculate", "calculate_joker", {card, context}, {context}, index))

                        -- Check if table is empty or not
                        if ret ~= nil and next(ret) then
                            if return_table == nil then
                                return_table = ret
                            else
                                local table_pointer = return_table
                                while table_pointer.extra ~= nil do
                                    table_pointer = table_pointer.extra
                                end
                                table_pointer.extra = ret
                            end
                        end
                    end
                end
            end
            return return_table
        end
    end,

    calc_dollar_bonus = function(self, card)
        if card.ability[card.config.center.key] and card.ability[card.config.center.key].copied_joker_abilities and #card.ability[card.config.center.key].copied_joker_abilities > 0 and card.ability.name == card.config.center.key then
            local dollar_bonus = 0
            for index = #card.ability[card.config.center.key].copied_joker_abilities, math.max(1, #card.ability[card.config.center.key].copied_joker_abilities - card.ability[card.config.center.key].copy_limit + 1), -1 do
                local center_to_copy = G.P_CENTERS[card.ability[card.config.center.key].copied_joker_abilities[index].key]
                if center_to_copy[card.config.center.key .. "_compat"] ~= false then
                    if card.ability[card.config.center.key] and card.ability[card.config.center.key].copied_joker_abilities and #card.ability[card.config.center.key].copied_joker_abilities > 0 then
                        local ret = table.unpack(All_in_Jest.use_copied_joker_function(card, "calc_dollar_bonus", "calculate_dollar_bonus", {card}, {}, index))
                        if ret ~= nil then
                            dollar_bonus = dollar_bonus + ret
                        end
                    end
                end
            end
            if dollar_bonus ~= 0 then
                return dollar_bonus
            end
        end
    end
}

local aij_smods_find_card_ref = SMODS.find_card
function SMODS.find_card(key, count_debuffed)
    local results = aij_smods_find_card_ref(key, count_debuffed)
    if not G.jokers or not G.jokers.cards then return {} end
    for _, area in ipairs(SMODS.get_card_areas('jokers')) do
        if area.cards then
            for _, v in pairs(area.cards) do
                if v and type(v) == 'table' and v.ability[v.config.center.key] and (count_debuffed or not v.debuff) then
                    -- Check if a single-copier is copying it
                    if v.ability[v.config.center.key].copied_joker_key == key and G.P_CENTERS[key][key .. "_compat"] ~= false then
                        table.insert(results, v)
                    end
                    -- Check if a multi-copier is copying it
                    if type(v.ability[v.config.center.key].copied_joker_abilities) == "table" and v.ability[v.config.center.key].copy_limit then
                        for i = #v.ability[v.config.center.key].copied_joker_abilities, math.max(1, #v.ability[v.config.center.key].copied_joker_abilities - v.ability[v.config.center.key].copy_limit + 1), -1 do
                            if v.ability[v.config.center.key].copied_joker_abilities[i] and v.ability[v.config.center.key].copied_joker_abilities[i].key == key and G.P_CENTERS[key][key .. "_compat"] ~= false then
                                table.insert(results, v)
                            end
                        end
                    end
                end
            end
        end
    end
    return results
end