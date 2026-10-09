local the_club = {
	object_type = "Blind",
	key = "the_club_GL",
	boss = {
		min = 1,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "xscore", "clubs", "suit" },
	boss_colour = HEX("b9cb92"),
	pos = { x = 0, y = 4 },
	order = 17,
	dollars = 5,
	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.all_in_jest and context.all_in_jest.before_after then
			local clubs = 0
			for _, card in ipairs(context.full_hand) do
				if card:is_suit("Clubs") then
					clubs = clubs + 1
				end
			end
			if clubs > 0 then
				G.GAME.aij_score_reduction = G.GAME.aij_score_reduction * math.max(1 - 0.2 * clubs, 0)
				blind:wiggle()
				blind.triggered = true
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_club } }
