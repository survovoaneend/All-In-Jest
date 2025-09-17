local czar = {
    object_type = "Joker",
    order = 365,
    key = "czar",
    config = {
    },
    rarity = 2,
    pos = { x = 14, y = 14},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    
    add_to_deck = function(self, card, from_debuff)
        local jokers = {}
        for k,v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.discovered and v.blueprint_compat and v.perishable_compat then
                if v.in_pool and type(v.in_pool) == 'function' then
                    if v:in_pool() then
                        jokers[#jokers+1] = v
                    end
                else
                    jokers[#jokers+1] = v
                end
            end
        end
        local joker_center = pseudorandom_element(jokers, pseudoseed('czar'))
        SMODS.bypass_create_card_edition = true
        local joker = create_card('Joker', G.all_in_jest.czar, nil, nil, true, nil, joker_center.key, 'czar')
        SMODS.bypass_create_card_edition = nil
        G.all_in_jest.czar:emplace(joker)
        joker.ability.all_in_jest = joker.ability.all_in_jest or {}
        joker.ability.all_in_jest.czar = tostring(card)
    end,

    remove_from_deck = function(self, card, from_debuff)
        for k,v in pairs(G.all_in_jest.czar.cards) do
            if v.ability.all_in_jest and v.ability.all_in_jest.czar == tostring(card) then
                v:remove()
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        if G.all_in_jest and G.all_in_jest.czar and G.all_in_jest.czar.cards then
            for k,v in pairs(G.all_in_jest.czar.cards) do
                if v.ability.all_in_jest and v.ability.all_in_jest.czar == tostring(card) then
                    local other_joker = v
                    info_queue[#info_queue + 1] = G.P_CENTERS[other_joker.config.center.key]
                end
            end
        end
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop then
            local jokers = {}
            for k,v in pairs(G.P_CENTER_POOLS["Joker"]) do
                if v.discovered and v.blueprint_compat then
                    if v.in_pool and type(v.in_pool) == 'function' then
                        if v:in_pool() then
                            jokers[#jokers+1] = v
                        end
                    else
                        jokers[#jokers+1] = v
                    end
                end
            end
            local joker_center = pseudorandom_element(jokers, pseudoseed('czar'))
            for k,v in pairs(G.all_in_jest.czar.cards) do
                if v.ability.all_in_jest and v.ability.all_in_jest.czar == tostring(card) then
                    v:remove()
                end
            end
            SMODS.bypass_create_card_edition = true
            local joker = create_card('Joker', G.all_in_jest.czar, nil, nil, true, nil, joker_center.key, 'czar')
            SMODS.bypass_create_card_edition = nil
            G.all_in_jest.czar:emplace(joker)
            joker.ability.all_in_jest = joker.ability.all_in_jest or {}
            joker.ability.all_in_jest.czar = tostring(card)
            if not context.blueprint then
                return {
                    message = localize('k_reset'),
                }
            end
        end
        for k,v in pairs(G.all_in_jest.czar.cards) do
            if v.ability.all_in_jest and v.ability.all_in_jest.czar == tostring(card) then
                local other_joker = v
                return SMODS.blueprint_effect(card, other_joker, context)
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {czar} }
