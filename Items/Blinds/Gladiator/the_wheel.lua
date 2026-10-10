local the_wheel = {
	object_type = "Blind",
	key = "the_wheel_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "face_down"},
	boss_colour = HEX("50bf7c"),
	pos = { x = 0, y = 10 },
	order = 29,
	dollars = 5,
 
	loc_vars = function(self)
		local numerator, denominator = SMODS.get_probability_vars(self, 1, 4, "the_wheel_GL")
		return { vars = { numerator, denominator } }
	end,
	collection_loc_vars = function(self)
		return { vars = { "1", "4" } }
	end,
 
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
 
		if blind.disabled then
			return
		end
 
		if
			context.stay_flipped
			and context.to_area == G.hand
			and SMODS.pseudorandom_probability(blind, "the_wheel_GL", 1, 4)
		then
			return { stay_flipped = true }
		end
	end,
}
return { name = { "Blinds" }, items = { the_wheel } }