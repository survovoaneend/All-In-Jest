local envy = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 13,
	key = "envy",
	pos = { x = 3, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 300,
	stack = 1,
	points = { 75 },
	apply = function(self, stack)
		G.GAME.modifiers.enable_aij_introverted = true
	end,
}
return { name = { "PolyStakeChips" }, items = { envy } }
