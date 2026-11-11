local mysterious_myriad = {
	object_type = "Blind",
	key = "mysterious_myriad",
	boss = {
		min = 1,
		showdown = true,
	},
	in_pool = function(self)
		return true
	end,
	mult = 2,
	attributes = { "xscore" },
	boss_colour = HEX("9e74a4"),
	atlas = "blinds_final",
	pos = { y = 15 },
	order = 1016,
	dollars = 8,

	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if context.all_in_jest and context.all_in_jest.before_after then
			local amt = 5 - #context.scoring_hand
			if amt > 0 then
				G.GAME.aij_score_reduction = G.GAME.aij_score_reduction * math.max(1 - 0.2 * amt, 0)
				blind:wiggle()
				blind.triggered = true
			end
		end
	end,
}
return { name = { "Finisher Blinds" }, items = { mysterious_myriad } }
