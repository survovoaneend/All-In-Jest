local the_needle = {
	object_type = "Blind",
	key = "the_needle_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "hands" },
	boss_colour = HEX("5c6e31"),
	pos = { x = 0, y = 20 },
	order = 14,
	dollars = 5,
	calculate = function(self, blind, context)
		if context.blind_disabled then
			ease_hands_played(blind.effect.hands_sub)
		end

		if blind.disabled then
			return
		end

		if context.setting_blind then
			blind.effect.hands_sub = G.GAME.round_resets.hands - 1
			ease_hands_played(-blind.effect.hands_sub)
		end
	end,
}
return { name = { "Blinds" }, items = { the_needle } }
