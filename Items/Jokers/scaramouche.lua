local scaramouche = {
    object_type = "Joker",
    order = 101,

    key = "scaramouche",
    config = {
        extra = {
            repetitions = 1,
            scaramouche_poker_hand = nil
        }
    },
    rarity = 2,
    pos = { x = 21, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,

    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local _poker_hands = {}
        for k, v in pairs(G.GAME.hands) do
            if v.visible and k ~= card.ability.scorecard_poker_hand then _poker_hands[#_poker_hands + 1] = k end
        end

        if not card.ability.extra.scaramouche_poker_hand then
            card.ability.extra.scaramouche_poker_hand = pseudorandom_element(_poker_hands, pseudoseed('scaramouche'))
        end
        return {
            vars = {
                card.ability.extra.scaramouche_poker_hand
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint then
            local _poker_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if v.visible and k ~= card.ability.extra.scaramouche_poker_hand then _poker_hands[#_poker_hands + 1] = k end
            end
            card.ability.extra.scaramouche_poker_hand = pseudorandom_element(_poker_hands, pseudoseed('scaramouche'))
            return {
                message = localize('k_reset')
        }
        end
        if context.repetition and context.cardarea == G.play then
            if context.scoring_name == card.ability.extra.scaramouche_poker_hand then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = card
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { scaramouche } }
