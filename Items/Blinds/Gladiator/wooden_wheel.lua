local wooden_wheel = {
	object_type = "Blind",
	key = "wooden_wheel_GL",
	boss = {
		showdown = true,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "joker" },
	boss_colour = HEX("9f7b60"),
	atlas = "blinds_final",
	pos = { y = 22 },
	order = 60,
	dollars = 8,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.setting_blind and #G.jokers.cards >= 1 then
			local _, index = pseudorandom_element(G.jokers.cards, pseudoseed("wooden_wheel_GL"))
			local target = G.jokers.cards[index]
			if not target then
				return
			end
			blind.triggered = true
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					play_sound("tarot1")
					if G.jokers.cards[index] then
						G.jokers.cards[index]:juice_up(0.3, 0.5)
					end
					return true
				end,
			}))
			All_in_Jest.reroll_joker(target, nil, "wooden_wheel_GL")
		end
	end,

	in_pool = function(self)
		if G.jokers then
			return #G.jokers.cards >= 1
		end
	end,
}
return { name = { "Finisher Blinds" }, items = { wooden_wheel } }