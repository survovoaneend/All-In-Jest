local lucky_horseshoe = {
    object_type = "Joker",
    order = 406,
    key = "lucky_horseshoe",
    
    config = {
        extra = {
            dollars = 3,
            xmult = 1.5,
            odds_money = 2,
            odds_mult = 3
        }
    },
    rarity = 2,
    pos = { x = 12, y = 14 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
        local numerator1, denominator1 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds_money, 'lucky_horseshoe')
        local numerator2, denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds_xmult, 'lucky_horseshoe')
        return {
            vars = {
                numerator1,
                denominator1,
                card.ability.extra.odds_money,
                card.ability.extra.odds_mult,
                card.ability.extra.dollars, 
                card.ability.extra.xmult, 
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and SMODS.has_enhancement(context.other_card, 'm_lucky') and not context.end_of_round then
            local ret = {}
            if SMODS.pseudorandom_probability(card, 'horseshoe_money', 1, card.ability.extra.odds_money) then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                ret.dollars = card.ability.extra.dollars
                ret.func = function()
                     G.E_MANAGER:add_event(Event({ func = function() G.GAME.dollar_buffer = 0; return true end }))
                end
            end
            if SMODS.pseudorandom_probability(card, 'horseshoe_mult', 1, card.ability.extra.odds_mult) then
                ret.xmult = card.ability.extra.xmult
            end
            if next(ret) then return ret end
        end
    end,
    in_pool = function(self, args)
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if SMODS.get_enhancements(card).m_lucky then
                    return true
                end
            end
        end
        return false
    end,
}

return { name = { "Jokers" }, items = { lucky_horseshoe } }
