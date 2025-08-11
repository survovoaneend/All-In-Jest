local bingo_card = {
    object_type = "Joker",
    order = 300,
    key = "bingo_card",
    config = {
      extra = {
          odds = 6,
          odds2 = 4,
          xmult = 2
      }
    },
    rarity = 2,
    pos = { x = 22, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local numerator1, denominator1 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        local numerator2, denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2)
        return {
            vars = {
                numerator1, denominator1,
                numerator2, denominator2,
                card.ability.extra.xmult
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if SMODS.get_enhancements(context.other_card).m_lucky then
                if SMODS.pseudorandom_probability(card, 'bingo_card', G.GAME.probabilities.normal or 1, card.ability.extra.odds2) then
                    return {
                        repetitions = 1,
                        card = context.other_card,
                        message = localize('k_again_ex')
                    }  
                end
            end
        end
        if context.individual and context.cardarea == G.play then
            if SMODS.get_enhancements(context.other_card).m_lucky then
                if SMODS.pseudorandom_probability(card, 'bingo_card', G.GAME.probabilities.normal or 1, card.ability.extra.odds) then
                    return {
                        xmult = card.ability.extra.xmult,
                        card = context.other_card,
                    }
                end
            end
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
return { name = {"Jokers"}, items = {bingo_card} }
