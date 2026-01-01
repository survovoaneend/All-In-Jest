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

local joker_png = {
    object_type = "single_copier",
    object_loader = All_in_Jest,
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
    blueprint_compat = true, -- uses ability.aij_blueprint_compat

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

    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or "??"
        end

        return All_in_Jest.single_copier.update(self, card, dt)
    end,

    set_ability = function(self, card, initial, delay_sprites)
        if G.playing_card then -- Check if in collection or not
            local joker_center, index = select_random_valid_joker()
            All_in_Jest.set_copied_joker(card, joker_center)
        end
    end,

    loc_vars = function(self, info_queue, card)
        _ = All_in_Jest.single_copier.loc_vars(self, info_queue, card)
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

        return All_in_Jest.single_copier.calculate(self, card, context)
    end,
}

return { name = {"Jokers"}, items = {joker_png} }
