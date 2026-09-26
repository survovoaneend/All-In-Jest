local the_pit = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 9,
	key = "the_pit",
	pos = { x = 8, y = 0 },
	atlas = "chips_atlas",
	stack = 1,
	points = { 150 },
	apply = function(self, stack) end,
}
return { name = { "PolyStakeChips" }, items = { the_pit } }
