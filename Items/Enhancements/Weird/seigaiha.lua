local seigaiha = {
	object_type = "Enhancement",
	key = "seigaiha",
	atlas = "enhancements_atlas",
	order = 11,
	pos = { x = 8, y = 4 },
	-- no_collection = true,
	config = {
		extra = {
			odds = 1,
		},
	},
	all_in_jest = {
		multi_enhancement_z_order = -1,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = { card.ability.extra.odds },
		}
	end,
	calculate = function(self, card, context)
		if
			context.mod_probability
			and context.trigger_obj
			and card.area == G.hand
			and not (card.highlighted and G.STATE == G.STATES.SELECTNG_HAND)
		then
			return {
				numerator = context.numerator + card.ability.extra.odds,
				denominator = context.denominator,
			}
		end
	end,

	in_pool = function(self, args)
		return G.GAME and G.GAME.all_in_jest and G.GAME.all_in_jest.weird_enhancements
	end,
}

return { name = { "Enhancements" }, items = { seigaiha } }
