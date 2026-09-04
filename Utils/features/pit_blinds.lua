
-- Check if Pit Blinds should appear or not
function All_in_Jest.pit_blinds_in_play()
    local blue_stake_replacement_blind = G.GAME.stake >= 5 and All_in_Jest.config.blue_stake_rework and G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante
    local all_pit_blinds_challenge = G.GAME.modifiers["aij_all_pit_blinds"] and G.GAME.round_resets.ante >= 2
    return blue_stake_replacement_blind or all_pit_blinds_challenge or G.GAME.won
end

-- Check if Pit Blinds should be guarenteed to show up
function All_in_Jest.force_pit_blind()
    local blue_stake_replacement_blind = G.GAME.stake >= 5 and All_in_Jest.config.blue_stake_rework and G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante
    local all_pit_blinds_challenge = G.GAME.modifiers["aij_all_pit_blinds"] and G.GAME.round_resets.ante >= 2
    local not_showdown_blind = not ((G.GAME.round_resets.ante)%G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2)
    return (blue_stake_replacement_blind or all_pit_blinds_challenge) and not_showdown_blind
end

function All_in_Jest.get_current_blind_mult()
    if G.GAME.blind.in_blind then
        local original_chips = G.GAME.blind.aij_original_chips > 0 and G.GAME.blind.aij_original_chips or G.GAME.blind.chips
        return (G.GAME.blind.chips - G.GAME.blind.aij_added_chips) / (original_chips / G.GAME.blind.aij_original_mult)
    else
        return G.GAME.blind.mult
    end
end