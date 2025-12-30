local select_random_valid_joker = function ()
    local jokers = {}
    for _, key in pairs(get_current_pool("Joker")) do
        local center = G.P_CENTERS[key]
        -- Disallowing jokers with a set_ability function, because those usually mess with the sprite and I cannot be bothered
        -- May disallow jokers with an "update" function too, but it seems to be alright with Vanilla and All in Jest alone
        if key ~= "j_aij_joker_png" and key ~= "UNAVAILABLE" and not (center.all_in_jest and center.all_in_jest.use_ability) and not center.set_ability then
            jokers[#jokers+1] = center
        end
    end
    local joker_center, index = pseudorandom_element(jokers, pseudoseed('joker_png'))
    return joker_center, index
end

-- May refactor in the future to use a Joker subclass that automatically implements the copy capabilities
-- (Instead of having to copy the relevant code to every similar joker)

local joker_png = {
    object_type = "Joker",
    order = 302,
    key = "joker_png",
    config = {
        aij_blueprint_compat = true,
        aij_dongtong_compat = true,
        j_aij_joker_png = { -- Store all data needed for this joker in a table with a matching key, this will be preserved on ability changes
            base_cost = 1,
            cost = 1,
            cost_increase = 1,
            copied_joker_key = nil,
            silver_multiplier_buff = 100, -- Make 100 instead of 1 to keep 2 decimals of precision
        }
    },
    rarity = 1,
    pos = { x = 24, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false, -- uses ability.aij_blueprint_compat
    eternal_compat = true,

    pixel_size = { w = 31, h = 40 },

    all_in_jest = {
        ability_cost = function(self, card)
            return card.ability.j_aij_joker_png.cost
        end,

        can_use_ability = function(self, card, context)
            if (to_big(G.GAME.dollars) - to_big(G.GAME.bankrupt_at)) >= to_big(card.ability.j_aij_joker_png.cost) then
                return true
            end
        end,

        use_ability = function(self, card)
            ease_dollars(-card.ability.j_aij_joker_png.cost)

            local joker_center, index = select_random_valid_joker()
            All_in_Jest.set_copied_joker(card, joker_center)

            card:juice_up(0.3, 0.5)
            card.ability.j_aij_joker_png.cost = card.ability.j_aij_joker_png.cost + card.ability.j_aij_joker_png.cost_increase
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_reroll')})
        end,

        -- A utility function for testing
        utils_set_joker_ability = function(self, card, joker_center)
            All_in_Jest.set_copied_joker(card, G.P_CENTERS[joker_center])

            card:juice_up(0.3, 0.5)
            card.ability.j_aij_joker_png.cost = card.ability.j_aij_joker_png.cost + card.ability.j_aij_joker_png.cost_increase
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_reroll')})
        end
    },

    set_ability = function(self, card, initial, delay_sprites)
        local joker_center, index = select_random_valid_joker()
        All_in_Jest.set_copied_joker(card, joker_center)
    end,

    add_to_deck = function(self, card, from_debuff)
        if card.ability.j_aij_joker_png and card.ability.j_aij_joker_png.copied_joker_key ~= nil then
            card.added_to_deck = false
            All_in_Jest.use_copied_joker_function(card, "add_to_deck", "add_to_deck", {card, true}, {true})
            card.added_to_deck = true
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        card.added_to_deck = true
        All_in_Jest.use_copied_joker_function(card, "remove_from_deck", "remove_from_deck", {card, true}, {true})
        card.added_to_deck = true
    end,

    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or 0
        end

        if card.ability.j_aij_joker_png and card.ability.j_aij_joker_png.copied_joker_key ~= nil then
            All_in_Jest.use_copied_joker_function(card, "update", "update", {card, dt}, {dt})
        end
    end,
  
    loc_vars = function(self, info_queue, card)
        if card.ability.j_aij_joker_png and card.ability.j_aij_joker_png.copied_joker_key ~= nil then
            local copied_center = G.P_CENTERS[card.ability.j_aij_joker_png.copied_joker_key]
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
                info_queue_center.specific_vars.aij_joker_png = card
            end
            info_queue[#info_queue + 1] = info_queue_center
        end

        return {
            vars = {
                card.ability.j_aij_joker_png.cost,
                card.ability.j_aij_joker_png.cost_increase,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.ante_change and context.ante_change ~= 0 and context.ante_end and not context.blueprint then
            card.ability.j_aij_joker_png.cost = card.ability.j_aij_joker_png.base_cost
            -- card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_reset')})
        end
        
        if card.ability.j_aij_joker_png and card.ability.j_aij_joker_png.copied_joker_key ~= nil then
            return table.unpack(All_in_Jest.use_copied_joker_function(card, "calculate", "calculate_joker", {card, context}, {context}))
        end
    end,

    calc_dollar_bonus = function(self, card)
        if card.ability.j_aij_joker_png and card.ability.j_aij_joker_png.copied_joker_key ~= nil then
            return table.unpack(All_in_Jest.use_copied_joker_function(card, "calc_dollar_bonus", "calculate_dollar_bonus", {card}, {}))
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
                if v and type(v) == 'table' and v.ability.j_aij_joker_png and v.ability.j_aij_joker_png.copied_joker_key == key and (count_debuffed or not v.debuff) then
                    table.insert(results, v)
                end
            end
        end
    end
    return results
end

return { name = {"Jokers"}, items = {joker_png} }
