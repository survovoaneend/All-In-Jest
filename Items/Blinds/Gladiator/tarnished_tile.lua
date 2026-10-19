local tarnished_tile = {
	object_type = "Blind",
	key = "tarnished_tile_GL",
	boss = {
		showdown = true,
		all_in_jest = {
			gladiator = true,
		},
	},
	in_pool = function(self)
		return true
	end,
	mult = 2,
	attributes = { "hand_size", "discard", "full_deck" },
	boss_colour = HEX("f28a3c"),
	atlas = "blinds_final",
	pos = { y = 14 },
	order = 58,
	dollars = 8,
	config = { extra = { draws = 0 } },

	calculate = function(self, blind, context)
		if blind.disabled then return end

		if context.hand_drawn then
			blind.ability.extra.draws = blind.ability.extra.draws + 1
			if blind.ability.extra.draws >= 3 then
				blind:wiggle()
				G.FUNCS.aij_draw_from_discard_to_deck(nil, true)
			end
		end
	end,
}
return { name = { "Finisher Blinds" }, items = { tarnished_tile } }
