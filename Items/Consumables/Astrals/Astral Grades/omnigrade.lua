local omnigrade = {
	object_loader = All_in_Jest,
	object_type = "Astral_Grade",
	key = "omnigrade",
	atlas = "astral_grades_atlas",
	badge_colour = G.C.SET.Spectral,
	pos = { x = 3, y = 0 },
	order = 3,
	config = {},
	attributes = { "hand_type", "space", "draw_cards" },
	all_in_jest = {
		rarity = 0,
	},

	choose_hand = function(self)
		return "All Hands"
	end,
}

return { name = { "Astral Grades" }, items = { omnigrade } }
