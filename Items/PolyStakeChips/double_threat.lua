local double_threat = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 14,
	ignore = true,
	key = "double_threat",
	pos = { x = 1, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 500,
	stack = 1,
	points = { 300 },
	apply = function(self, stack)
		G.GAME.aij_has_big_boss = true
	end,
}
return { name = { "PolyStakeChips" }, items = { double_threat } }
