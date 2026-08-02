local select_random_valid_joker = function ()
    local jokers = {}
    for _, key in pairs(get_current_pool("Joker")) do
        local center = G.P_CENTERS[key]
        -- Disallowing jokers with a set_ability function, because those usually mess with the sprite and I cannot be bothered
        -- May disallow jokers with an "update" function too, but it seems to be alright with Vanilla and All in Jest alone
        if
            key ~= "j_aij_czar" and
            key ~= "UNAVAILABLE" and
            center ~= nil and
            center.discovered and
            not (center.all_in_jest and center.all_in_jest.use_ability) and
            not (center.config.j_aij_czar_compat == false) and
            not (center.config[key]) -- Disallow copiers, bandaid fix for a bug
        then
            jokers[#jokers+1] = key
        end
    end
    local joker_center_key, index = pseudorandom_element(jokers, pseudoseed('joker_png'))
    return G.P_CENTERS[joker_center_key], index
end

local czar = {
    object_type = "single_copier",
    object_loader = All_in_Jest,
    order = 365,
    key = "czar",
    config = {
        aij_blueprint_compat = true,
        j_aij_czar = { -- Store all data needed for this joker in a table with a matching key, this will be preserved on ability changes
            copied_joker_key = nil,
            silver_multiplier_buff = 100, -- Make 100 instead of 1 to keep 2 decimals of precision
        }
    },
    attributes = { 'copying', 'reroll' },
    rarity = 2,
    pos = { x = 14, y = 14},
    atlas = 'joker_atlas',
    cost = 6,
    ignore = true,
    unlocked = true,
    discovered = false,
    blueprint_compat = true, -- uses ability.aij_blueprint_compat

    set_ability = function(self, card, initial, delay_sprites)
        local joker_center, index = select_random_valid_joker()
        All_in_Jest.set_copied_joker(card, joker_center)
    end,

    loc_vars = function(self, info_queue, card)
        _ = All_in_Jest.single_copier.loc_vars(self, info_queue, card)
    end,

    calculate = function(self, card, context)
        if context.reroll_shop then
            local joker_center, index = select_random_valid_joker()
            All_in_Jest.set_copied_joker(card, joker_center)

            card:juice_up(0.3, 0.5)
            if not context.blueprint then
                return {
                    message = localize('k_reroll'),
                }
            end
        end

        return All_in_Jest.single_copier.calculate(self, card, context)
    end,
}

return { name = {"Jokers"}, items = {czar} }
