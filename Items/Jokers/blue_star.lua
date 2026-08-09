local blue_star = {
    object_type = "Joker",
    order = 513,
    key = "blue_star",
    config = {
        extra = {
            odds = 2
        }
    },
    attributes = { 'hand_level', 'hand_type', 'chance', 'enhancements' },
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
                if SMODS.has_enhancement(v, 'm_bonus') or (G.P_CENTERS.m_aij_fervent and SMODS.has_enhancement(v, 'm_aij_fervent'))  then
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
    end,
    in_pool = function(self, args)
        local chip_cards = 0
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(card, 'm_bonus') or SMODS.has_enhancement(card, 'm_aij_fervent' then
                    chip_cards = chip_cards + 1
                end
            end
        end
        if chip_cards > 0 then
            return true
        else
            return false
        end
    end,
}

return { name = { "Jokers" }, items = { blue_star } }
