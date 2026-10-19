local the_manacle = {
	object_type = "Blind",
	key = "the_manacle_GL",
	boss = {
		min = 1,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "hand_size" },
	boss_colour = HEX("575757"),
	pos = { x = 0, y = 8 },
	order = 3,
	dollars = 5,

	set_blind = function(self)
		G.GAME.current_round.aij_the_manacle = { hand_size = 0 }
	end,
	disable = function(self)
		G.hand:change_size(-G.GAME.current_round.aij_the_manacle.hand_size)
	end,
	defeat = function(self)
		if not G.GAME.blind.disabled then
			G.hand:change_size(-G.GAME.current_round.aij_the_manacle.hand_size)
		end
		G.GAME.current_round.aij_the_manacle = nil
	end,
	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.before then
			G.hand:change_size(-1)
			G.GAME.current_round.aij_the_manacle.hand_size = G.GAME.current_round.aij_the_manacle.hand_size + 1
		end
	end,
}
return { name = { "Blinds" }, items = { the_manacle } }
