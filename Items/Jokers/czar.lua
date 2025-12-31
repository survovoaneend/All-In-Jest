local select_random_valid_joker = function ()
    local jokers = {}
    for _, key in pairs(get_current_pool("Joker")) do
        local center = G.P_CENTERS[key]
        -- Disallowing jokers with a set_ability function, because those usually mess with the sprite and I cannot be bothered
        -- May disallow jokers with an "update" function too, but it seems to be alright with Vanilla and All in Jest alone
        if key ~= "j_aij_czar" and key ~= "UNAVAILABLE" and not (center.all_in_jest and center.all_in_jest.use_ability) and not center.set_ability then
            if center.discovered then
                jokers[#jokers+1] = center
            end
        end
    end
    local joker_center, index = pseudorandom_element(jokers, pseudoseed('czar'))
    return joker_center, index
end

local czar = {
    object_type = "single_copier",
    object_loader = All_in_Jest,
    order = 365,
    key = "czar",
    config = {
        aij_blueprint_compat = true,
        aij_dongtong_compat = true,
        j_aij_czar = { -- Store all data needed for this joker in a table with a matching key, this will be preserved on ability changes
            copied_joker_key = nil,
            silver_multiplier_buff = 100, -- Make 100 instead of 1 to keep 2 decimals of precision
        }
    },
    rarity = 2,
    pos = { x = 14, y = 14},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false, -- uses ability.aij_blueprint_compat
    eternal_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        if G.playing_card then -- Check if in collection or not
            local joker_center, index = select_random_valid_joker()
            All_in_Jest.set_copied_joker(card, joker_center)
        end
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
