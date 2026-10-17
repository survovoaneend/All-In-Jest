local the_clay = {
	object_type = "Blind",
	key = "the_clay_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 4,
	attributes = { "large_blind" },
	boss_colour = HEX("95a4a9"),
	atlas = "blinds",
	pos = { X = 0, y = 23 },
	order = 18,
	dollars = 5,

	set_blind = function(self)
		if not next(SMODS.find_card("j_aij_fall_of_count_chaligny")) then
			local add_mult = pseudorandom("clay", 0, 5) + math.floor(100 * pseudorandom("clay")) / 100 -- Randomises an integer part (0-2) and a decimal part (0.00 to 0.99) before adding both together
			add_mult = add_mult + 0.01 -- Do this so people dont think The Clay is bugged
			All_in_Jest.ease_blind_requirement(add_mult, 0, true)
		end
	end,

	disable = function()
		G.GAME.blind.chips = G.GAME.blind.aij_original_chips
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,

	defeat = function(self)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
	end,
}
-- code in aureate coin
return { name = { "Blinds" }, items = { the_clay } }
