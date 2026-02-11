local blue_star = {
    object_type = "Joker",
    order = 494,
    key = "blue_star",
    config = {
        extra = {
            odds = 2
        }
    },
    rarity = 2,
    pos = { x = 4, y = 22 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'blue_star')
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_fervent
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local trigger = false
            for _, v in ipairs(context.scoring_hand) do
                if v.config.center == G.P_CENTERS.m_bonus or (G.P_CENTERS.m_aij_fervent and v.config.center == G.P_CENTERS.m_aij_fervent)  then
                    trigger = true
                    break
                end
            end
            
            if trigger and SMODS.pseudorandom_probability(card, 'blue_star', 1, card.ability.extra.odds) then
                return {
                    level_up = true,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { blue_star } }
