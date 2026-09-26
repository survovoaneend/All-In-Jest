local sloth = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 2,
	key = "sloth",
	pos = { x = 3, y = 0 },
	atlas = "chips_atlas",
	stack = 1,
	points = { 25 },
	apply = function(self, stack) end,
}
return { name = { "PolyStakeChips" }, items = { sloth } }
