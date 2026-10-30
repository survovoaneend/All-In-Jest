local spica = {
	object_type = "Consumable",
	key = "spica",
	set = "aij_astral",
	atlas = "consumable_atlas",
	pos = { x = 12, y = 5 },
	soul_pos = { x = 12, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
	order = 9,
	config = { pin = "Spica", extra = {} },
	attributes = { "hand_type", "space", "boss_blind" },
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
			["astral_grade_aij_retrograde"] = 0.01,
			["astral_grade_aij_passigrade"] = 0.5,
			["astral_grade_aij_prograde"] = 0.49,
		},
	},
}
local spica_pin = {
	object_loader = All_in_Jest,
	object_type = "Astral",
	key = "spica_pin",
	pin = "Spica",
	atlas = "misc_atlas",
	pos = { x = 4, y = 1 },
	discovered = false,
	order = 9,
	config = {},

	pixel_size = { w = 53, h = 28 },

	loc_vars = function(self, info_queue, card)
		local active_text = "(" .. localize("k_inactive") .. ")"
		if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
			active_text = "(" .. localize("k_active") .. ")"
		end
		return {
			vars = {
				card.ability.extra.hand,
				active_text,
			},
		}
	end,

	calculate = function(self, card, context)
		if
			context.before
			and context.main_eval
			and G.GAME.blind
			and G.GAME.blind.boss
			and not G.GAME.blind.disabled
		then
			for i, astral in ipairs(G.GAME.Astral_pins[card.ability.extra.hand]) do
				if astral.pin == "Spica" then
					table.remove(G.GAME.Astral_pins[card.ability.extra.hand], i)
					break
				end
			end
			G.GAME.blind:disable()
			play_sound("timpani")
			delay(0.4)
			return {
				message = localize("ph_boss_disabled"),
			}
		end
	end,

	add_to_deck = function(self, card, from_debuff)
		local eval = function()
			return G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled
		end
		juice_card_until(card, eval, true)
	end,
}
return { name = { "Astrals" }, items = { spica, spica_pin } }
