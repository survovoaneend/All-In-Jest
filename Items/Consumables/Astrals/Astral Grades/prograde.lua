local prograde = {
	object_loader = All_in_Jest,
	object_type = "Astral_Grade",
	key = "prograde",
	atlas = "stickers_atlas",
	pos = { x = 1, y = 3 },
	order = 1,
	config = {},
	attributes = { "hand_type", "space", "draw_cards" },
	all_in_jest = {
		rarity = 0.45,
	},

	choose_hand = function(self)
		local _remove_tally = 0
		for k, v in ipairs(G.handlist) do
			if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played >= _remove_tally then
				_remove_tally = G.GAME.hands[v].played
			end
		end
		local vaild_hands = {}
		for k, v in ipairs(G.handlist) do
			if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played < _remove_tally then
				vaild_hands[#vaild_hands + 1] = v
			end
		end
		if #vaild_hands <= 0 then
			for k, v in ipairs(G.handlist) do
				if SMODS.is_poker_hand_visible(v) then
					vaild_hands[#vaild_hands + 1] = v
				end
			end
		end
		_hand = pseudorandom_element(vaild_hands, pseudoseed("prograde"))
		return _hand
	end,
}

return { name = { "Astral Grades" }, items = { prograde } }
