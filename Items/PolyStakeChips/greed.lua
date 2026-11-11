local greed = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 4,
	key = "greed",
	pos = { x = 2, y = 0 },
	atlas = "chips_atlas",
	stack = 1,
	points = { 50 },
	apply = function(self, stack)
		G.GAME.modifiers.enable_rentals_in_shop = true
	end,
}
return { name = { "PolyStakeChips" }, items = { greed } }
