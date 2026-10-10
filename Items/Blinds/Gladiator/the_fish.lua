local the_fish = {
	object_type = "Blind",
	key = "the_fish_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "face_down", "discard" },
	boss_colour = HEX("3e85bd"),
	pos = { x = 0, y = 5 },
	order = 28,
	dollars = 5,
 
	calculate = function(self, blind, context)
		if context.blind_disabled then
			for i = 1, #G.hand.cards do
				if G.hand.cards[i].facing == "back" then
					G.hand.cards[i]:flip()
				end
			end
			for _, playing_card in pairs(G.playing_cards) do
				playing_card.ability.wheel_flipped = nil
			end
		end
 
		if context.setting_blind or context.hand_drawn then
			blind.prepped = nil
		end
 
		if blind.disabled then
			return
		end
 
		if context.pre_discard then
			blind.prepped = true
		end
		if context.stay_flipped and context.to_area == G.hand and blind.prepped then
			return { stay_flipped = true }
		end
	end,
}
return { name = { "Blinds" }, items = { the_fish } }