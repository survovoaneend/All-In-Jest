
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

-- Hook for The Arm's downgrades
-- If one of chips/mult are at base levels, then downgrade the other appropriately
local aij_level_up_hand_ref = level_up_hand
function level_up_hand(card, hand, instant, amount)
    if amount ~= nil and amount < 1 then
        local obj = G.GAME.hands[hand]
        local freeze_mult = false
        local freeze_chips = false
        if obj.mult <= obj.s_mult then
            freeze_mult = true
        end
        if obj.chips <= obj.s_chips then
            freeze_chips = true
        end
        if freeze_chips and freeze_mult then
            return
        elseif freeze_chips then
            return level_up_hand_mult(card, hand, instant, amount)
        elseif freeze_mult then
            return level_up_hand_chips(card, hand, instant, amount)
        end
    end
    return aij_level_up_hand_ref(card, hand, instant, amount)
end
