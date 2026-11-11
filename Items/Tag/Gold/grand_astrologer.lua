local grand_astrologer = {
	object_type = "Tag",
	key = "grand_astrologer",

	pos = { x = 11, y = 4 },
	atlas = "tag_atlas",
	config = {
		aij = {
			upgrade = "aij_astrology",
		},
	},
	attributes = { "planet", "hand_level" },

	discovered = false,
	order = 99,
	min_ante = nil,

	loc_vars = function(self, info_queue, tag)
		return { vars = {} }
	end,

	apply = function(self, tag, context)
		if context.type == "using_consumeable" then
			if context.consumeable.ability.set == "Planet" then
				G.E_MANAGER:add_event(Event({
					func = function()
						tag:juice_up()
						return true
					end,
				}))
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
					{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
				)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						play_sound("tarot1")
						context.consumeable:juice_up(0.8, 0.5)
						G.TAROT_INTERRUPT_PULSE = true
						return true
					end,
				}))
				update_hand_text({ delay = 0 }, { mult = "+", StatusText = true })
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.9,
					func = function()
						play_sound("tarot1")
						context.consumeable:juice_up(0.8, 0.5)
						return true
					end,
				}))
				update_hand_text({ delay = 0 }, { chips = "+", StatusText = true })
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.9,
					func = function()
						play_sound("tarot1")
						context.consumeable:juice_up(0.8, 0.5)
						G.TAROT_INTERRUPT_PULSE = nil
						return true
					end,
				}))
				update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = "+1" })
				-- delay(1.3)
				SMODS.upgrade_poker_hands({
					level_up = pseudorandom("jest_grand_astrologer_tag", 2, 4),
					instant = true,
				})
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
					{ mult = 0, chips = 0, handname = "", level = "" }
				)
				tag:jest_apply("+", G.C.ATTENTION, function()
					return true
				end, function()
					return true
				end)
				tag.triggered = true
				return true
			end
		end
	end,
	in_pool = function(self, args)
		return false
	end,
}
return { name = "Tags", items = { grand_astrologer } }
