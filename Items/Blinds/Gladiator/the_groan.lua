local the_groan = {
	object_type = "Blind",
	key = "the_groan_GL",
	boss = {
		min = 4,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "large_blind", "hands" },
	boss_colour = HEX("3d6065"),
	atlas = "blinds",
	pos = { X = 0, y = 21 },
	order = 21,
	dollars = 5,

	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if context.after then
			if G.GAME.chips + SMODS.calculate_round_score() < G.GAME.blind.chips then
				All_in_Jest.ease_blind_requirement(2, 0)
				blind.triggered = true
			end
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
return { name = { "Blinds" }, items = { the_groan } }
