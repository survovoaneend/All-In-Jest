local passigrade = {
	object_loader = All_in_Jest,
	object_type = "Astral_Grade",
	key = "passigrade",
	atlas = "astral_grades_atlas",
	pos = { x = 2, y = 0 },
	order = 2,
	config = {},
	attributes = { "hand_type", "space", "draw_cards" },
	all_in_jest = {
		rarity = 0.45,
	},

	choose_hand = function(self)
		local vaild_hands = {}
		for k, v in ipairs(G.handlist) do
			if SMODS.is_poker_hand_visible(v) then
				vaild_hands[#vaild_hands + 1] = v
			end
		end
		local _hand = pseudorandom_element(vaild_hands, pseudoseed("passigrade"))
		return _hand
	end,
}

return { name = { "Astral Grades" }, items = { passigrade } }
