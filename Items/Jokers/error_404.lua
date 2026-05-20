local get_valid_jokers = function (exclude)
    local valid_jokers = {}
    if G.jokers then
        for i = 1, #G.jokers.cards do
            if 
                G.jokers.cards[i].config.center.key ~= 'j_aij_error_404' and 
                (G.jokers.cards[i].ability.aij_blueprint_compat or G.jokers.cards[i].config.center.blueprint_compat) and
                G.jokers.cards[i].unique_val ~= exclude 
            then
                valid_jokers[#valid_jokers+1] = G.jokers.cards[i]
            end
        end
    end

    return valid_jokers
end

local error_404 = {
    object_type = "Joker",
    order = 405,
    key = "error_404",
    config = {
        extra = {
            currently_copied = '0'
        }
    },
    rarity = 2,
    pos = { x = 18, y = 14 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local target_joker = nil
        if G.jokers then
            for _, v in ipairs(G.jokers.cards) do
                if card.ability.extra.currently_copied == tostring(v.unique_val) then
                    target_joker = v
                    break
                end
            end
        end

        if target_joker then
            local copied_center = target_joker.config.center
            local info_queue_center = { -- Create a simplified "fake" center that can be used without referencing/modifying the actual center object
                key = copied_center.key,
                name = copied_center.name,
                config = copied_center.config,
                blueprint_compat = copied_center.blueprint_compat,
                discovered = true,
                set = "Joker",
                create_fake_card = copied_center.create_fake_card,
                generate_ui = copied_center.generate_ui,
                loc_vars = copied_center.loc_vars
            }

            local other_vars = nil
            if copied_center.loc_vars then
                local ret = copied_center:loc_vars({}, target_joker)
                if ret then
                    other_vars = ret.vars
                end
            else
                other_vars, _, _ = target_joker:generate_UIBox_ability_table(true)
            end

            if other_vars then
                info_queue_center.specific_vars = other_vars
                info_queue_center.specific_vars.aij_elder = target_joker
            end

            info_queue[#info_queue + 1] = info_queue_center

            card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ''
            card.ability.blueprint_compat_check = nil
            local main_end = (card.area and card.area == G.jokers) and {
                {n=G.UIT.C, config={align = "bm", minh = 0.4}, nodes={
                    {n=G.UIT.C, config={ref_table = card, align = "m", colour = G.C.JOKER_GREY, r = 0.05, padding = 0.06, func = 'blueprint_compat'}, nodes={
                        {n=G.UIT.T, config={ref_table = card.ability, ref_value = 'blueprint_compat_ui',colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8}},
                    }}
                }}
            } or nil

            return { vars = { localize{type="name_text", set="Joker", key = copied_center.key} }, main_end = main_end }
        end

        return { vars = { "None" } }
    end,

    calculate = function(self, card, context)
        if context.after then
            local valid_jokers = get_valid_jokers(card.ability.extra.currently_copied)
            if #valid_jokers > 0 then
                valid_jokers = get_valid_jokers()
            end
            local cur_joker = pseudorandom_element(valid_jokers, pseudoseed('error_404'))
            if G.jokers and cur_joker then
                card.ability.extra.currently_copied = tostring(cur_joker.unique_val)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_aij_change_ex')})
            end
        end
        
        local target_joker = nil
        if G.jokers then
            for _, v in ipairs(G.jokers.cards) do
                if card.ability.extra.currently_copied == tostring(v.unique_val) then
                    target_joker = v
                    break
                end
            end
        end
        if target_joker and target_joker ~= card then
            return SMODS.blueprint_effect(card, target_joker, context)
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        local cur_joker = pseudorandom_element(get_valid_jokers(), pseudoseed('error_404'))
        if G.jokers and cur_joker then
            card.ability.extra.currently_copied = tostring(cur_joker.unique_val)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_aij_change_ex')})
        end
    end,

    update = function(self, card, dt)
        local target_joker = nil
        if G.jokers then
            for k, v in pairs(G.jokers.cards) do
                if card.ability.extra.currently_copied == tostring(v.unique_val) then
                    target_joker = v
                    break
                end
            end
        end
        if target_joker and target_joker ~= card and (target_joker.ability.aij_blueprint_compat or target_joker.config.center.blueprint_compat) then
            card.ability.blueprint_compat = 'compatible'
        else
            card.ability.blueprint_compat = 'incompatible'
        end
    end,
}

return { name = { "Jokers" }, items = { error_404 } }
