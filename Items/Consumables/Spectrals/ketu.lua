local ketu = {
	object_type = "Consumable",
	key = "ketu",
	set = "Spectral",
	atlas = "consumable_atlas",
	pos = { x = 13, y = 3 },
	soul_pos = { x = 13, y = 4 },
	cost = 4,
	hidden = true,
	soul_rate = 0.003,
	soul_set = "aij_astral",
	unlocked = true,
	discovered = false,
	order = 110,
	config = { pin = "Ketu", extra = {} },
	-- no attributes yet, soulable objects not yet supported by SMODS
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
			},
		}
	end,
	all_in_jest = {
		as_astral = true,
	},
	inject = function(self)
		SMODS.Spectral.inject(self)
		SMODS.ObjectTypes["aij_astral"]:inject_card(self)
	end,
}
local ketu_pin = {
	object_loader = All_in_Jest,
	object_type = "Astral",
	key = "ketu",
	pin = "Ketu",
	alt_set = "Spectral",
	atlas = "misc_atlas",
	pos = { x = 5, y = 0 },
	discovered = false,
	order = 110,
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
		if context.repetition_only or context.retrigger_joker_check then
			if context.other_card == G.jokers.cards[1] then
				return {
					repetitions = 1,
				}
			end
		end
	end,
}
return { name = { "Astrals", "Spectrals" }, items = { ketu, ketu_pin } }
