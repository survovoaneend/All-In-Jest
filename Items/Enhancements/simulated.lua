local simulated = {
	object_type = "Enhancement",
	key = "simulated",
	atlas = "aij_multi_simulated_atlas",
	order = 5,
	pos = { x = 0, y = 0 },
	config = {
		extra = {
            played_this_round = false,
			handsize = 1,
			prev_handsize = "0"
		},
	},
	all_in_jest = {
		multi_enhancement_z_order = -2,
	},
	loc_vars = function(self, info_queue, card)
		return {
			-- vars = {card.ability.extra.handsize},
			vars = {1},
		}
	end,
	calculate = function(self, card, context)
		if
			context.aij_discard_played_hand
			and context.other_card == card
			and not card.ability.extra.played_this_round
		then
            card.ability.extra.played_this_round = true
			return {
				aij_return_to_hand = true,
			}
		end

		if context.playing_card_end_of_round then
            card.ability.extra.played_this_round = false
		end

	end,
	update = function(self, card, dt)
		local prev = tonumber(card.ability.extra.prev_handsize)
		if card.ability.extra.played_this_round then
			-- to-do: reenable this once charged cards are fixed
			-- if card.ability.extra.handsize ~= prev then
			-- 	local diff = card.ability.extra.handsize - prev
			-- 	card.ability.card_limit = card.ability.card_limit + diff
			-- 	card.ability.extra.prev_handsize = tostring(card.ability.extra.handsize)
			-- end

			-- this code is temporary and should be removed once the above code is able to be put back in
			if prev and prev ~= 1 then
				card.ability.card_limit = card.ability.card_limit + 1
				card.ability.extra.prev_handsize = "1"
			end
		else
			-- this code is fine either way, just letting u know
			-- remove this comment later once we do the rest of the changes
			if prev and prev ~= 0 then
				card.ability.card_limit = card.ability.card_limit - prev
				card.ability.extra.prev_handsize = "0"
			end
		end
	end
}
return { name = { "Enhancements" }, items = { simulated } }
