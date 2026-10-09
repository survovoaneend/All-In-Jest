local the_goad = {
	object_type = "Blind",
	key = "the_goad_GL",
	boss = {
		min = 1,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "xscore", "spades", "suit" },
	boss_colour = HEX("b95c96"),
	pos = { x = 0, y = 13 },
	order = 15,
	dollars = 5,
	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if context.all_in_jest and context.all_in_jest.before_after then
			local spades = 0
			for _, card in ipairs(context.full_hand) do
				if card:is_suit("Spades") then
					spades = spades + 1
				end
			end
			if spades > 0 then
				G.GAME.aij_score_reduction = G.GAME.aij_score_reduction * math.max(1 - 0.2*spades, 0)
				blind:wiggle()
				blind.triggered = true
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_goad } }
