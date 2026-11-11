local rubber_duck = {
	object_type = "Blind",
	key = "rubber_duck_GL",
	boss = {
		min = 1,
		showdown = true,
		all_in_jest = {
			gladiator = true,
		},
	},
	in_pool = function(self)
		return true
	end,
	mult = 2,
	attributes = { "hand_level" },
	boss_colour = HEX("e6c56f"),
	atlas = "blinds_final",
	pos = { y = 6 },
	order = 59,
	dollars = 8,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end

		if context.modify_hand then
			blind.triggered = true
			hand_chips = mod_chips(G.GAME.hands[context.scoring_name].s_chips)
			mult = mod_mult(G.GAME.hands[context.scoring_name].s_mult)
			update_hand_text({ sound = "chips2", modded = true }, { chips = hand_chips, mult = mult })
		end
	end,
}
return { name = { "Finisher Blinds" }, items = { rubber_duck } }
