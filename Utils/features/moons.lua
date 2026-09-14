-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
-- Functions used for moons
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function level_up_hand_chips(card, hand, instant, amount)
	amount = amount or 1
	SMODS.upgrade_poker_hands({
		hands = hand,
		func = function(base, hand, parameter, level_up)
			return base + G.GAME.hands[hand]["l_" .. parameter] * level_up * 2
		end,
		level_up = amount,
		from = card,
		instant = instant,
		parameters = { "chips" },
	})
end

function level_up_hand_mult(card, hand, instant, amount)
	amount = amount or 1
	SMODS.upgrade_poker_hands({
		hands = hand,
		func = function(base, hand, parameter, level_up)
			return base + G.GAME.hands[hand]["l_" .. parameter] * level_up * 2
		end,
		level_up = amount,
		from = card,
		instant = instant,
		parameters = { "mult" },
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

local unboosted_weight_planet_keys = {
	["c_mercury"] = true,
	["c_aij_vulcanoid"] = true,
	["c_aij_phaethon"] = true,
	["c_venus"] = true,
	["c_aij_zoozve"] = true,
	["c_aij_2013_nd15"] = true,
	["c_earth"] = true,
	["c_aij_luna"] = true,
	["c_aij_kamooalewa"] = true,
	["c_mars"] = true,
	["c_aij_phobos"] = true,
	["c_aij_deimos"] = true,
	["c_jupiter"] = true,
	["c_aij_europa"] = true,
	["c_aij_callisto"] = true,
	["c_saturn"] = true,
	["c_aij_titan"] = true,
	["c_aij_iapetus"] = true,
	["c_uranus"] = true,
	["c_aij_umbriel"] = true,
	["c_aij_oberon"] = true,
	["c_neptune"] = true,
	["c_aij_triton"] = true,
	["c_aij_proteus"] = true,
	["c_pluto"] = true,
	["c_aij_nix"] = true,
	["c_aij_charon"] = true,
	["c_planet_x"] = true,
	["c_aij_planet_nine"] = true,
	["c_aij_nibiru"] = true,
	["c_ceres"] = true,
	["c_aij_pallas"] = true,
	["c_aij_2000_eu16"] = true,
	["c_eris"] = true,
	["c_aij_dysnomia"] = true,
	["c_aij_kuiper"] = true,

	-- Paperback spectrum moons
	["c_paperback_quaoar"] = true,
	["c_aij_paper_weywot"] = true,
	["c_aij_paper_namaka"] = true,
	["c_paperback_haumea"] = true,
	["c_aij_paper_ilmare"] = true,
	["c_aij_paper_salacia"] = true,
	["c_paperback_sedna"] = true,
	["c_aij_paper_ixion"] = true,
	["c_aij_paper_hiiaka"] = true,
	["c_paperback_makemake"] = true,
	["c_aij_paper_varda"] = true,
	["c_aij_paper_mk2"] = true,

	-- Bunco spectrum moons
	["c_bunc_quaoar"] = true,
	["c_aij_bunc_weywot"] = true,
	["c_aij_bunc_namaka"] = true,
	["c_bunc_haumea"] = true,
	["c_aij_bunc_ilmare"] = true,
	["c_aij_bunc_salacia"] = true,
	["c_bunc_sedna"] = true,
	["c_aij_bunc_ixion"] = true,
	["c_aij_bunc_hiiaka"] = true,
	["c_bunc_makemake"] = true,
	["c_aij_bunc_varda"] = true,
	["c_aij_bunc_mk2"] = true,
}

local aij_smods_get_weight_of_object_ref = SMODS.get_weight_of_object
function SMODS.get_weight_of_object(obj, opt_weight, args)
	w, m = aij_smods_get_weight_of_object_ref(obj, opt_weight, args)

	if All_in_Jest.config.moons_enabled then
		if obj and obj.key and unboosted_weight_planet_keys[obj.key] then
			m = m / 3
		end
	end

	return w, m
end
