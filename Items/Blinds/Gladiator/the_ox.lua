local the_ox = {
	object_type = "Blind",
	key = "the_ox_GL",
	boss = {
		min = 6,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "lose_economy" },
	boss_colour = HEX("b95b08"),
	pos = { x = 0, y = 2 },
	order = 38,
	dollars = 5,
	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.debuff_hand then
			blind.triggered = false
			if G.GAME.hands[context.scoring_name].played > 5 then
				blind.triggered = true
				if not context.check then
					return {
						dollars = -G.GAME.dollars,
						instant = true,
						func = function()
							blind:wiggle()
						end,
					}
				end
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_ox } }
