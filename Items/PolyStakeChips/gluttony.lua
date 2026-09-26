local gluttony = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 3,
	key = "gluttony",
	pos = { x = 4, y = 0 },
	atlas = "chips_atlas",
	stack = 1,
	points = { 75 },
	apply = function(self, stack) end,
}
return { name = { "PolyStakeChips" }, items = { gluttony } }
