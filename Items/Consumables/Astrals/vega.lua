local vega = {
	object_type = "Consumable",
	key = "vega",
	set = "aij_astral",
	atlas = "consumable_atlas",
	pos = { x = 16, y = 5 },
	soul_pos = { x = 16, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
	order = 13,
	config = { pin = "Vega", extra = {} },
	attributes = { "hand_type", "space", "retrigger" },
	loc_vars = function(self, info_queue, card)
		-- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				not (card.area and card.area.config.collection) and card.ability.astral_hand or "(hand)",
			},
		}
	end,
	all_in_jest = {
		grades = {
			["astral_grade_aij_retrograde"] = 0.2,
			["astral_grade_aij_passigrade"] = 0.6,
			["astral_grade_aij_prograde"] = 0.2,
		},
	},
}
local vega_pin = {
	object_loader = All_in_Jest,
	object_type = "Astral",
	key = "vega_pin",
	pin = "Vega",
	atlas = "misc_atlas",
	pos = { x = 8, y = 1 },
	discovered = false,
	order = 13,
	config = {},

	pixel_size = { w = 53, h = 28 },

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.hand and context.other_card == G.hand.cards[1] then
			return {
				message = localize("k_again_ex"),
				repetitions = 1,
				card = card,
			}
		end
	end,
}
return { name = { "Astrals" }, items = { vega, vega_pin } }
