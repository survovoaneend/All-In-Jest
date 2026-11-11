local obsidian_blade = {
	object_type = "Blind",
	key = "obsidian_blade_GL",
	boss = {
		showdown = true,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 3,
	attributes = { "large_blind", "hands", "discard" },
	boss_colour = HEX("635d91"),
	atlas = "blinds_final",
	pos = { y = 1 },
	order = 56,
	dollars = 8,

	set_blind = function(self)
		local hands_sub = math.max(G.GAME.current_round.hands_left - 1, 0)
		local discards_sub = math.max(G.GAME.current_round.discards_left - 1, 0)
		G.GAME.current_round.aij_obsidian_blade_GL = { hands = hands_sub, discards = discards_sub }
		ease_hands_played(-hands_sub)
		ease_discard(-discards_sub)
	end,

	disable = function(self)
		local stats = G.GAME.current_round.aij_obsidian_blade_GL
		if stats then
			ease_hands_played(stats.hands)
			ease_discard(stats.discards)
		end
		G.GAME.current_round.aij_obsidian_blade_GL = nil
		G.GAME.blind.chips = G.GAME.blind.chips / 2
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,

	defeat = function(self)
		G.GAME.current_round.aij_obsidian_blade_GL = nil
	end,
}
return { name = { "Finisher Blinds" }, items = { obsidian_blade } }
