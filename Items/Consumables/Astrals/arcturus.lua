local arcturus = {
	object_type = "Consumable",
	key = "arcturus",
	set = "aij_astral",
	atlas = "consumable_atlas",
	pos = { x = 13, y = 5 },
	soul_pos = { x = 13, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
	order = 10,
	config = { pin = "Arcturus", extra = { discards = 1 } },
	attributes = { "hand_type", "space", "discard" },
	loc_vars = function(self, info_queue, card)
		-- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				not (card.area and card.area.config.collection) and card.ability.astral_hand or "(hand)",
				card.ability.consumeable.extra.discards,
			},
		}
	end,
	all_in_jest = {
		grades = {
			["astral_grade_aij_retrograde"] = 0.4,
			["astral_grade_aij_passigrade"] = 0.4,
			["astral_grade_aij_prograde"] = 0.2,
		},
	},
}
local arcturus_pin = {
	object_loader = All_in_Jest,
	object_type = "Astral",
	key = "arcturus_pin",
	pin = "Arcturus",
	atlas = "misc_atlas",
	pos = { x = 5, y = 1 },
	discovered = false,
	order = 10,
	config = {},

	pixel_size = { w = 53, h = 28 },

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
				card.ability.extra.discards,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.after then
			ease_discard(card.ability.extra.discards)
			local loc_key = "a_aij_discards_plus"
			if card.ability.extra.discards == 1 then
				loc_key = "a_aij_discards_plus_singular"
			end
			return {
				message = localize({ type = "variable", key = loc_key, vars = { card.ability.extra.discards } }),
				colour = G.C.RED,
			}
		end
	end,
}
return { name = { "Astrals" }, items = { arcturus, arcturus_pin } }
