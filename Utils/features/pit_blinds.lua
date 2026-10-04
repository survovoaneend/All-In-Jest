-- Check if Pit Blinds should appear or not
function All_in_Jest.pit_blinds_in_play()
	local blue_stake_replacement_blind = (
		(G.GAME.stake >= 5 and All_in_Jest.config.blue_stake_rework)
		or (G.GAME.aij_poly_chips and G.GAME.aij_poly_chips["aij_the_pit"] > 0)
	) and G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante
	local all_pit_blinds_challenge = G.GAME.modifiers["aij_all_pit_blinds"] and G.GAME.round_resets.ante >= 2
	return blue_stake_replacement_blind or all_pit_blinds_challenge or G.GAME.won
end

-- Check if Pit Blinds should be guarenteed to show up
function All_in_Jest.force_pit_blind()
	local blue_stake_replacement_blind = (
		(G.GAME.stake >= 5 and All_in_Jest.config.blue_stake_rework)
		or (G.GAME.aij_poly_chips and G.GAME.aij_poly_chips["aij_the_pit"] > 0)
	) and G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante
	local all_pit_blinds_challenge = G.GAME.modifiers["aij_all_pit_blinds"] and G.GAME.round_resets.ante >= 2
	local not_showdown_blind = not (G.GAME.round_resets.ante % G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2)
	return (blue_stake_replacement_blind or all_pit_blinds_challenge) and not_showdown_blind
end

function All_in_Jest.get_current_blind_mult()
	if G.GAME.blind.in_blind then
		local original_chips = G.GAME.blind.aij_original_chips > 0 and G.GAME.blind.aij_original_chips
			or G.GAME.blind.chips
		return (G.GAME.blind.chips - G.GAME.blind.aij_added_chips) / (original_chips / G.GAME.blind.aij_original_mult)
	else
		return G.GAME.blind.mult
	end
end

function All_in_Jest.gladiator_blinds_in_play()
	return G.GAME.aij_poly_chips and G.GAME.aij_poly_chips['aij_gladiator'] > 0
end

G.FUNCS.jest_gladiator_blinds = function(e)
	G.GAME.jest_gladiator_tab = not G.GAME.jest_gladiator_tab
	G.FUNCS.overlay_menu{
		definition = create_UIBox_your_collection_blinds(),
		config = { offset = { x = 0, y = 0 } }
	}
end

-- remove gladiator blinds from collection count unless one is discovered
local set_discover_tallies_ref = set_discover_tallies
function set_discover_tallies()
	All_in_Jest.hide_gladiator_blinds = true
	for _, v in pairs(G.P_BLINDS) do
		if v.boss and v.boss.all_in_jest and v.boss.all_in_jest.gladiator and v.discovered then
			All_in_Jest.hide_gladiator_blinds = false
			break
		end
	end
	set_discover_tallies_ref()
end

local hide_from_collection_ref = SMODS.hide_from_collection
function SMODS.hide_from_collection(obj, args)
	if All_in_Jest.hide_gladiator_blinds and obj.boss and obj.boss.all_in_jest and obj.boss.all_in_jest.gladiator then
		return true
	end
	return hide_from_collection_ref(obj, args)
end
