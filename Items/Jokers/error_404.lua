local error_404 = {
    object_type = "Joker",
    order = 405,
    key = "error_404",
    config = {
        extra = {
            current_slot = '0'
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
            for k, v in pairs(G.jokers.cards) do
                if tonumber(card.ability.extra.current_slot) == k then
                    target_joker = v
                end
            end
        end

        if target_joker then
            local other_vars = nil
            if target_joker.config.center.loc_vars then
                local ret = target_joker.config.center:loc_vars({}, target_joker)
                if ret then
                    other_vars = ret.vars
                end
            else
                other_vars, _, _ = target_joker:generate_UIBox_ability_table(true)
            end

            if other_vars then
                target_joker.config.center.specific_vars = other_vars
                target_joker.config.center.specific_vars.aij_elder = true
            end

            info_queue[#info_queue + 1] = target_joker.config.center

            return { vars = { localize{type="name_text", set="Joker", key = target_joker.config.center.key} } }
        end

        return { vars = { "None" } }
    end,

    calculate = function(self, card, context)
        if context.after then
            local valid_jokers = {}
            if G.jokers then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key ~= 'j_aij_error_404' and tonumber(card.ability.extra.current_slot) ~= i then
                        valid_jokers[#valid_jokers+1] = G.jokers.cards[i]
                    end
                end
                if #valid_jokers <= 0 then
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].config.center.key ~= 'j_aij_error_404' then
                            valid_jokers[#valid_jokers+1] = G.jokers.cards[i]
                        end
                    end
                end
            end
            local cur_joker = pseudorandom_element(valid_jokers, pseudoseed('error_404'))
            if G.jokers and cur_joker then
                for k, v in pairs(G.jokers.cards) do
                    if v == cur_joker then
                        card.ability.extra.current_slot = tostring(k)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_aij_change_ex')})
                    end
                end
            end
        end
        local target_joker = nil
        if G.jokers then
            for k, v in pairs(G.jokers.cards) do
                if tonumber(card.ability.extra.current_slot) == k then
                    target_joker = v
                end
            end
        end
        if target_joker then
            return SMODS.blueprint_effect(card, target_joker, context)
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        local valid_jokers = {}
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.key ~= 'j_aij_error_404' then
                    valid_jokers[#valid_jokers+1] = G.jokers.cards[i]
                end
            end
        end
        local cur_joker = pseudorandom_element(valid_jokers, pseudoseed('error_404'))
        if G.jokers and cur_joker then
            for k, v in pairs(G.jokers.cards) do
                if v == cur_joker then
                    card.ability.extra.current_slot = tostring(k)
                end
            end
        end
    end,
}
return { name = { "Jokers" }, items = { error_404 } }
