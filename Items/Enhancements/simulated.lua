local simulated = {
	object_type = "Enhancement",
	key = "simulated",
	atlas = "aij_multi_simulated_atlas",
	order = 5,
	pos = { x = 0, y = 0 },
	config = {
		extra = {
            played_this_round = false
		},
	},
	all_in_jest = {
		multi_enhancement_z_order = -2,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	calculate = function(self, card, context)
		if
			context.aij_discard_played_hand
			and context.other_card == card
			and not card.ability.played_this_round
		then
            card.ability.played_this_round = true
			return {
				aij_return_to_hand = true,
			}
		end

		if context.setting_blind then
            card.ability.played_this_round = false
		end

	end,
}
return { name = { "Enhancements" }, items = { simulated } }
