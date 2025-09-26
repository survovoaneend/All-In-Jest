local spawn_czar_joker = function (card)
    local jokers = {}
    -- for rarity, _ in pairs(SMODS.Rarity.obj_table) do
        -- for _, key in pairs(get_current_pool("Joker"), rarity) do
        for _, key in pairs(get_current_pool("Joker")) do
            local center = G.P_CENTERS[key]
            if key ~= "j_aij_czar" and key ~= "UNAVAILABLE" and All_in_Jest.expanded_copier_compat(center, true) then
                jokers[#jokers+1] = center
            end
        end
    -- end
    local joker_center = pseudorandom_element(jokers, pseudoseed('czar'))
    SMODS.bypass_create_card_edition = true
    local joker = create_card('Joker', G.all_in_jest_czar, nil, nil, true, nil, joker_center.key, 'czar')
    SMODS.bypass_create_card_edition = nil
    G.all_in_jest_czar:emplace(joker)
    joker.ability.all_in_jest = joker.ability.all_in_jest or {}
    joker.ability.all_in_jest.czar = card.unique_val
end

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
        spawn_czar_joker(card)
    end,

    remove_from_deck = function(self, card, from_debuff)
        for _,v in pairs(G.all_in_jest_czar.cards) do
            if v.ability.all_in_jest and v.ability.all_in_jest.czar == card.unique_val then
                v:remove()
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        if G.all_in_jest_czar.cards then
            for _,v in pairs(G.all_in_jest_czar.cards) do
                if v.ability.all_in_jest and v.ability.all_in_jest.czar == card.unique_val then
                    local other_joker = v
                    local other_vars = nil
                    if other_joker.config.center.loc_vars then
                        local ret = other_joker.config.center:loc_vars({}, other_joker)
                        if ret then
                            other_vars = ret.vars
                        end
                    else
                        other_vars, _, _ = other_joker:generate_UIBox_ability_table(true)
                    end
                    if other_vars then
                        other_joker.config.center.specific_vars = other_vars
                        other_joker.config.center.specific_vars.aij_czar = other_joker
                    end
                    info_queue[#info_queue + 1] = G.P_CENTERS[other_joker.config.center.key]
                end
            end
        end
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop then
            for _,v in pairs(G.all_in_jest_czar.cards) do
                if v.ability.all_in_jest and v.ability.all_in_jest.czar == card.unique_val then
                    v:remove()
                end
            end
            spawn_czar_joker(card)
            if not context.blueprint then
                return {
                    message = localize('k_reset'),
                }
            end
        end
        for _,v in pairs(G.all_in_jest_czar.cards) do
            if v.ability.all_in_jest and v.ability.all_in_jest.czar == card.unique_val then
                local other_joker = v
                return SMODS.blueprint_effect(card, other_joker, context)
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {czar} }
