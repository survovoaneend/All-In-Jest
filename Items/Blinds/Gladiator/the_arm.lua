local the_arm = {
	object_type = "Blind",
	key = "the_arm_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "hand_level" },
	boss_colour = HEX("6865f3"),
	pos = { x = 0, y = 11 },
	order = 16,
	dollars = 5,
	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.debuff_hand and not context.check then
			local hands = {}
			blind.triggered = false
			for k, v in pairs(G.GAME.hands) do
				if v.level > 1 then
					hands[#hands + 1] = k
					blind.triggered = true
				end
			end
			if blind.triggered then
				-- code from black hole
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
					{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
				)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						play_sound("tarot1")
						G.TAROT_INTERRUPT_PULSE = true
						return true
					end,
				}))
				update_hand_text({ delay = 0 }, { mult = "-", StatusText = true })
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.9,
					func = function()
						play_sound("tarot1")
						return true
					end,
				}))
				update_hand_text({ delay = 0 }, { chips = "-", StatusText = true })
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.9,
					func = function()
						play_sound("tarot1")
						G.TAROT_INTERRUPT_PULSE = nil
						return true
					end,
				}))
				update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = "-1" })
				delay(1.3)
				SMODS.upgrade_poker_hands({
					hands = hands,
					level_up = -1,
					instant = true,
				})
				update_hand_text({ nopulse = nil, delay = 0 }, {
					handname = context.scoring_name,
					level = G.GAME.hands[context.scoring_name].level,
					mult = G.GAME.hands[context.scoring_name].mult,
					chips = G.GAME.hands[context.scoring_name].chips,
				})
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_arm } }
