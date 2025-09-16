local joker_png = {
    object_type = "Joker",
    order = 302,
    key = "joker_png",
    config = {
      extra = {
          cost = 1
      }
    },
    rarity = 1,
    pos = { x = 24, y = 11},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    pixel_size = { w = 31, h = 40 },

    all_in_jest = {
        ability_cost = function(self, card)
            return card.ability.extra.cost
        end,

        can_use_ability = function(self, card, context)
            if to_big(G.GAME.dollars) >= to_big(card.ability.extra.cost) then
                return true
            end
        end,

        use_ability = function(self, card)
            ease_dollars(-card.ability.extra.cost)
            local jokers = {}
            for k,v in pairs(G.P_CENTER_POOLS["Joker"]) do
                if v.discovered and v.blueprint_compat and v.perishable_compat and v.rarity ~= 4 then
                    if v.in_pool and type(v.in_pool) == 'function' then
                        if v:in_pool() then
                            jokers[#jokers+1] = v
                        end
                    else
                        jokers[#jokers+1] = v
                    end
                end
            end
            local joker_center = pseudorandom_element(jokers, pseudoseed('joker_png'))
            for k,v in pairs(G.all_in_jest.joker_png.cards) do
                if v.ability.all_in_jest and v.ability.all_in_jest.joker_png == tostring(card) then
                    v:remove()
                end
            end
            SMODS.bypass_create_card_edition = true
            local joker = create_card('Joker', G.all_in_jest.joker_png, nil, nil, true, nil, joker_center.key, 'joker_png')
            SMODS.bypass_create_card_edition = nil
            G.all_in_jest.joker_png:emplace(joker)
            joker.ability.all_in_jest = joker.ability.all_in_jest or {}
            joker.ability.all_in_jest.joker_png = tostring(card)
            card:juice_up(0.3, 0.5)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_reset')})
        end,
    },

    add_to_deck = function(self, card, from_debuff)
        local jokers = {}
        for k,v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.discovered and v.blueprint_compat and v.rarity ~= 4 then
                if v.in_pool and type(v.in_pool) == 'function' then
                    if v:in_pool() then
                        jokers[#jokers+1] = v
                    end
                else
                    jokers[#jokers+1] = v
                end
            end
        end
        local joker_center = pseudorandom_element(jokers, pseudoseed('joker_png'))
        SMODS.bypass_create_card_edition = true
        local joker = create_card('Joker', G.all_in_jest.joker_png, nil, nil, true, nil, joker_center.key, 'joker_png')
        SMODS.bypass_create_card_edition = nil
        G.all_in_jest.joker_png:emplace(joker)
        joker.ability.all_in_jest = joker.ability.all_in_jest or {}
        joker.ability.all_in_jest.joker_png = tostring(card)
    end,

    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or 0
        end
    end,
  
    loc_vars = function(self, info_queue, card)
        if G.all_in_jest and G.all_in_jest.joker_png then
            for k,v in pairs(G.all_in_jest.joker_png.cards) do
                if v.ability.all_in_jest and v.ability.all_in_jest.joker_png == tostring(card) then
                    local other_joker = v
                    info_queue[#info_queue + 1] = G.P_CENTERS[other_joker.config.center.key]
                end
            end
        end
        return {
            vars = {
                card.ability.extra.cost,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,
  
    calculate = function(self, card, context)
        for k,v in pairs(G.all_in_jest.joker_png.cards) do
            if v.ability.all_in_jest and v.ability.all_in_jest.joker_png == tostring(card) then
                local other_joker = v
                return SMODS.blueprint_effect(card, other_joker, context)
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {joker_png} }
