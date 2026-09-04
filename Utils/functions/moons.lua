
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
-- Functions used for moons
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function level_up_hand_chips(card, hand, instant, amount)
    amount = amount or 1
    SMODS.upgrade_poker_hands({
        hands = hand,
        func = function(base, hand, parameter, level_up)
            return base + G.GAME.hands[hand]['l_' .. parameter] * level_up * 2
        end,
        level_up = amount,
        from = card,
        instant = instant,
        parameters = {"chips"}
    })
end

function level_up_hand_mult(card, hand, instant, amount)
    amount = amount or 1
    SMODS.upgrade_poker_hands({
        hands = hand,
        func = function(base, hand, parameter, level_up)
            return base + G.GAME.hands[hand]['l_' .. parameter] * level_up * 2
        end,
        level_up = amount,
        from = card,
        instant = instant,
        parameters = {"mult"}
    })
end