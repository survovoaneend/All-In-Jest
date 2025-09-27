local spawn_joker_png_joker = function (card)
    local jokers = {}
    -- for rarity, _ in pairs(SMODS.Rarity.obj_table) do
        -- for _, key in pairs(get_current_pool("Joker"), rarity) do
        for _, key in pairs(get_current_pool("Joker")) do
            local center = G.P_CENTERS[key]
            if key ~= "j_aij_joker_png" and key ~= "UNAVAILABLE" and All_in_Jest.expanded_copier_compat(center, true) then
                jokers[#jokers+1] = center
            end
        end
    -- end
    local joker_center, index = pseudorandom_element(jokers, pseudoseed('joker_png'))
    SMODS.bypass_create_card_edition = true
    local joker = create_card('Joker', G.all_in_jest_joker_png, nil, nil, true, nil, joker_center.key, 'joker_png')
    SMODS.bypass_create_card_edition = nil
    G.all_in_jest_joker_png:emplace(joker)
    joker.ability.all_in_jest = joker.ability.all_in_jest or {}
    joker.ability.all_in_jest.joker_png = card.unique_val

    -- Useful debugging
    -- sendDebugMessage(index, "AIJ")
    -- sendDebugMessage(joker_center.key, "AIJ")
end

local joker_png = {
    object_type = "Joker",
    order = 302,
    key = "joker_png",
    config = {
      extra = {
          base_cost = 1,
          cost = 1
      }
    },
    rarity = 1,
    pos = { x = 24, y = 11},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
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

            for _,v in pairs(G.all_in_jest_joker_png.cards) do
                if v.ability.all_in_jest and v.ability.all_in_jest.joker_png == card.unique_val then
                    v:remove()
                end
            end

            spawn_joker_png_joker(card)

            card:juice_up(0.3, 0.5)
            card.ability.extra.cost = card.ability.extra.cost + 1
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_reset')})
        end,
    },

    add_to_deck = function(self, card, from_debuff)
        spawn_joker_png_joker(card)
    end,

    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or 0
        end
    end,
  
    loc_vars = function(self, info_queue, card)
        if G.all_in_jest_joker_png then
            for _,v in pairs(G.all_in_jest_joker_png.cards) do
                if v.ability.all_in_jest and v.ability.all_in_jest.joker_png == card.unique_val then
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
                        other_joker.config.center.specific_vars.aij_joker_png = other_joker
                    end
                    info_queue[#info_queue + 1] = other_joker.config.center
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
        if context.ante_change and context.ante_change ~= 0 then
            card.ability.extra.cost = card.ability.extra.base_cost
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_reset')})
        end
        for _,v in pairs(G.all_in_jest_joker_png.cards) do
            if v.ability.all_in_jest and v.ability.all_in_jest.joker_png == card.unique_val then
                local other_joker = v
                return SMODS.blueprint_effect(card, other_joker, context)
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {joker_png} }
