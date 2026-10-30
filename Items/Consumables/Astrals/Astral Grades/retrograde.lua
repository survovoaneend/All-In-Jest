local retrograde = {
	object_loader = All_in_Jest,
	object_type = "Astral_Grade",
	key = "retrograde",
	atlas = "stickers_atlas",
	pos = { x = 0, y = 3 },
	order = 0,
	config = {},
	attributes = { "hand_type", "space", "draw_cards" },
	all_in_jest = {
		rarity = 0.1,
	},

	choose_hand = function(self)
		local _tally = 0
		for k, v in ipairs(G.handlist) do
			if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played >= _tally then
				_hand = v
				_tally = G.GAME.hands[v].played
			end
		end
		return _hand
	end,
}

return { name = { "Astral Grades" }, items = { retrograde } }
