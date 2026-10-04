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

	disable = function(self)
		G.hand:change_size(-(G.GAME.blind.hand_size_taken or 0))
	end,
	defeat = function(self)
		if G.GAME.blind.disabled then
			return
		end
		G.hand:change_size(-(G.GAME.blind.hand_size_taken or 0))
	end,
	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.before then
			G.hand:change_size(-1)
			blind.hand_size_taken = (blind.hand_size_taken or 0) + 1
		end
	end,
}
return { name = { "Blinds" }, items = { the_manacle } }
