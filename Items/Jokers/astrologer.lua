local astrologer = {
	object_type = "Joker",
	order = 320,
	ignore = not All_in_Jest.config.moons_enabled,
	key = "astrologer",
	config = {
		extra = {
			picks = 1,
		},
	},
	attributes = { "moon", "planet", "booster", "passive", "space" },
	rarity = 2,
	pos = { x = 10, y = 12 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.picks,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.open_booster then
			if
				context.card.config.center.kind == "Celestial"
				and G.GAME.jest_change_booster_options.pack_choices ~= "unlimited"
			then
				G.GAME.pack_choices = G.GAME.pack_choices + card.ability.extra.picks
			end
		end
	end,
}

-- Theoretically less RNG than changing the object pool, and does exactly what it says
-- Also allows other planets without moons to appear, which seems fairer
local ref_smods_poll_object_aij = SMODS.poll_object
function SMODS.poll_object(args)
	local output_key = ref_smods_poll_object_aij(args)

	if
		args.type == "Planet"
		and G.P_CENTERS[output_key].set == "Planet"
		and next(SMODS.find_card("j_aij_astrologer"))
	then
		for k, v in pairs(G.P_CENTER_POOLS.Planet) do
			if v.config.moon and v.config.hand_type == G.P_CENTERS[output_key].config.hand_type then
				if (G.GAME.round_resets.ante % 2) == 0 then
					if v.config.chips then
						output_key = v.key
						break
					end
				else
					if v.config.mult then
						output_key = v.key
						break
					end
				end
			end
		end
	end

	return output_key
end

return { name = { "Jokers" }, items = { astrologer } }
