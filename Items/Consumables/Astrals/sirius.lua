local sirius = {
	object_type = "Consumable",
	key = "sirius",
	set = "aij_astral",
	atlas = "consumable_atlas",
	pos = { x = 8, y = 3 },
	soul_pos = { x = 8, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
	order = 4,
	config = { pin = "Sirius", extra = { cards = 1 } },
	attributes = { "hand_type", "space", "retrigger" },
	loc_vars = function(self, info_queue, card)
		-- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				not (
							card.area
							and card.area.config.collection
							and not card.area.config.aij_card_select_collection
						)
						and card.ability.astral_hand
					or "(hand)",
				card.ability.extra.cards,
			},
		}
	end,
	all_in_jest = {
		grades = {
			["astral_grade_aij_retrograde"] = 0.15,
			["astral_grade_aij_passigrade"] = 0.55,
			["astral_grade_aij_prograde"] = 0.3,
		},
	},
}
local sirius_pin = {
	object_loader = All_in_Jest,
	object_type = "Astral",
	key = "sirius_pin",
	pin = "Sirius",
	atlas = "misc_atlas",
	pos = { x = 0, y = 0 },
	discovered = false,
	order = 4,
	config = {},

	pixel_size = { w = 53, h = 28 },

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
				card.ability.extra.cards,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play then
			if context.other_card then
				if not card.ability.extra.random_cards then
					card.ability.extra.random_cards = {}
					for i = 1, card.ability.extra.cards do
						card.ability.extra.random_cards[#card.ability.extra.random_cards + 1] =
							pseudorandom_element(context.scoring_hand, pseudoseed("sirius"))
					end
				end
				local retriggers = 0
				for k, v in pairs(card.ability.extra.random_cards) do
					if context.other_card == v then
						retriggers = retriggers + 1
					end
				end
				if retriggers > 0 then
					return {
						message = localize("k_again_ex"),
						repetitions = retriggers,
					}
				end
			end
		end
		if context.after and not context.repetition then
			card.ability.extra.random_cards = nil
		end
	end,
}
return { name = { "Astrals" }, items = { sirius, sirius_pin } }
