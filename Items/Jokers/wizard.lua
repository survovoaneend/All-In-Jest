local wizard = {
    object_type = "Joker",
    order = 451,
    key = "wizard",
    
    config = {
        extra = {
            odds = 4
        }
    },
    rarity = 3,
    pos = { x = 13, y = 26 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'wizard')
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local upgraded = {}
            for _, v in ipairs(context.scoring_hand) do
                if v.config.center == G.P_CENTERS.c_base and SMODS.pseudorandom_probability(card, 'wizard', 1, card.ability.extra.odds) then
                    table.insert(upgraded, v)
                end
            end

            if #upgraded > 0 then
                for _, v in ipairs(upgraded) do
                    local type_roll = pseudorandom('wizard_type')
                    local new_ability = G.P_CENTERS.m_mult
                    if type_roll > 0.66 then new_ability = G.P_CENTERS.m_bonus
                    elseif type_roll > 0.33 then new_ability = G.P_CENTERS.m_lucky end
                    
                    v:set_ability(new_ability, nil, true)
                end
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for _, v in ipairs(upgraded) do
                            v:juice_up()
                        end
                        return true
                    end
                })) 
                return {
                    message = localize('k_aij_change_ex'),
                    colour = G.C.PURPLE
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { wizard } }
