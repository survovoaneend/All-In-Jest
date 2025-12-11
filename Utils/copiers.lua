table.unpack = table.unpack or unpack -- Latest lua replaces unpack with table.unpack, Balatro uses older lua
-- Old lua does not have a reverse to unpack, this implements a workaround
table.pack = table.pack or function (args)
    return { args }
end

-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
-- A set of utility functions used for new jokers that copy joker abilities without the other joker being owned
-- Currently: Joker.png
-- Planned: Visage, Clay Joker, Czar
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

-- Gives the copier joker the ability attributes of the card its copying
-- Includes some hard-coded vanilla stuff, cannot do the same for modded jokers as set_ability also handles sprites.
-- Note card vs center - card is the individual card object that renders in the game, center is the data stored in G.P_CENTERS and is not attached to an individual joker
All_in_Jest.set_copied_ability = function(copier_card, center_to_copy)
    local new_ability = {
        -- name = center_to_copy.name,
        -- effect = center_to_copy.effect,
        -- set = center_to_copy.set,
        mult = center_to_copy.config.mult or 0,
        h_mult = center_to_copy.config.h_mult or 0,
        h_x_mult = center_to_copy.config.h_x_mult or 0,
        h_dollars = center_to_copy.config.h_dollars or 0,
        p_dollars = center_to_copy.config.p_dollars or 0,
        t_mult = center_to_copy.config.t_mult or 0,
        t_chips = center_to_copy.config.t_chips or 0,
        x_mult = center_to_copy.config.Xmult or center_to_copy.config.x_mult or 1,
        h_chips = center_to_copy.config.h_chips or 0,
        x_chips = center_to_copy.config.x_chips or 1,
        h_x_chips = center_to_copy.config.h_x_chips or 1,
        repetitions = center_to_copy.config.repetitions or 0,
        h_size = center_to_copy.config.h_size or 0,
        d_size = center_to_copy.config.d_size or 0,
        extra = copy_table(center_to_copy.config.extra) or nil,
        extra_value = 0,
        type = center_to_copy.config.type or '',
        order = center_to_copy.order or nil,
        forced_selection = copier_card.ability and copier_card.ability.forced_selection or nil,
        perma_bonus = copier_card.ability and copier_card.ability.perma_bonus or 0,
        perma_x_chips = copier_card.ability and copier_card.ability.perma_x_chips or 0,
        perma_mult = copier_card.ability and copier_card.ability.perma_mult or 0,
        perma_x_mult = copier_card.ability and copier_card.ability.perma_x_mult or 0,
        perma_h_chips = copier_card.ability and copier_card.ability.perma_h_chips or 0,
        perma_h_x_chips = copier_card.ability and copier_card.ability.perma_h_x_chips or 0,
        perma_h_mult = copier_card.ability and copier_card.ability.perma_h_mult or 0,
        perma_h_x_mult = copier_card.ability and copier_card.ability.perma_h_x_mult or 0,
        perma_p_dollars = copier_card.ability and copier_card.ability.perma_p_dollars or 0,
        perma_h_dollars = copier_card.ability and copier_card.ability.perma_h_dollars or 0,
        perma_repetitions = copier_card.ability and copier_card.ability.perma_repetitions or 0,
        card_limit = copier_card.ability and copier_card.ability.card_limit or 0,
        extra_slots_used = copier_card.ability and copier_card.ability.extra_slots_used or 0,
    }
    copier_card.ability = copier_card.ability or {}
    new_ability.extra_value = nil
    copier_card.ability.extra_value = copier_card.ability.extra_value or 0
    for k, v in pairs(new_ability) do
        copier_card.ability[k] = v
    end
    copier_card.ability.aij_blueprint_compat = center_to_copy.blueprint_compat

    if center_to_copy.name == "Invisible Joker" then 
        center_to_copy.invis_rounds = 0
    end
    if center_to_copy.name == 'To Do List' then
        local _poker_hands = {}
        for k, v in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(k) then _poker_hands[#_poker_hands+1] = k end
        end
        local old_hand = copier_card.ability.to_do_poker_hand
        copier_card.ability.to_do_poker_hand = nil

        while not copier_card.ability.to_do_poker_hand do
            copier_card.ability.to_do_poker_hand = pseudorandom_element(_poker_hands, pseudoseed((copier_card.area and copier_card.area.config.type == 'title') and 'false_to_do' or 'to_do'))
            if copier_card.ability.to_do_poker_hand == old_hand then copier_card.ability.to_do_poker_hand = nil end
        end
    end
    if center_to_copy.name == 'Caino' then 
        copier_card.ability.caino_xmult = 1
    end
    if center_to_copy.name == 'Yorick' then 
        copier_card.ability.yorick_discards = copier_card.ability.extra.discards
    end
    if center_to_copy.name == 'Loyalty Card' then 
        copier_card.ability.burnt_hand = 0
        copier_card.ability.loyalty_remaining = copier_card.ability.extra.every
    end
end

-- A boilerplate function that lets a copier joker use one of the methods of the joker its copying
-- Vanilla jokers are implemented differently, and so are handled seperately
All_in_Jest.use_copied_joker_function = function(card, modded_func_name, vanilla_func_name, modded_func_args, vanilla_func_args)
    if vanilla_func_name == nil then
        vanilla_func_args = modded_func_args
    end
    vanilla_func_name = vanilla_func_name or modded_func_name
    if card.ability[card.config.center.key].copied_joker ~= nil then
        local obj = G.P_CENTERS[card.ability[card.config.center.key].copied_joker]
        if obj[modded_func_name] and type(obj[modded_func_name]) == 'function' then
            -- Modded Jokers
            local ret = table.pack(obj[modded_func_name](obj, table.unpack(modded_func_args)))
            return ret
        else
            -- Vanilla Jokers
            local old_name = card.ability.name
            local old_func = card.config.center[modded_func_name]
            card.ability.name = obj.name
            card.config.center[modded_func_name] = nil

            local ret = table.pack(card[vanilla_func_name](card, table.unpack(vanilla_func_args)))

            card.ability.name = old_name
            card.config.center[modded_func_name] = old_func

            return ret
        end
    end
end

-- Sets a copier joker to copy a specified joker
All_in_Jest.set_copied_joker = function(copier_card, copied_center)
    -- Set added_to_deck before and after as remove_from_deck does not execute if card is not added to deck
    copier_card.added_to_deck = true
    All_in_Jest.use_copied_joker_function(copier_card, "remove_from_deck", "remove_from_deck", {copier_card, true}, {true})
    copier_card.added_to_deck = true

    if copied_center == nil or (not copied_center.key) then
        copied_center = G.P_CENTERS['j_joker']
    end
    All_in_Jest.set_copied_ability(copier_card, copied_center)
    local joker_key = copied_center.key
    copier_card.ability[copier_card.config.center.key].copied_joker = joker_key

    local copier_ability = copy_table(copier_card.ability[copier_card.config.center.key])
    
    copier_card.ability[copier_card.config.center.key] = copier_ability

    -- Set added_to_deck before and after as add_to_deck does not execute if card is already added to deck
    copier_card.added_to_deck = false
    All_in_Jest.use_copied_joker_function(copier_card, "add_to_deck", "add_to_deck", {copier_card, true}, {true})
    copier_card.added_to_deck = true
end