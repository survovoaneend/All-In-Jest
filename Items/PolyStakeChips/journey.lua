local journey = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 22,
	key = "journey",
	pos = { x = 6, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 1000,
	stack = 2,
	points = { 150, 300 },
	apply = function(self, stack)
		G.GAME.win_ante = G.GAME.win_ante + stack
	end,
}
return { name = { "PolyStakeChips" }, items = { journey } }
