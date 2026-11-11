local wrath = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 15,
	key = "wrath",
	pos = { x = 2, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 850,
	stack = 1,
	points = { 50 },
	apply = function(self, stack)
		G.GAME.modifiers.enable_aij_indecisive = true
	end,
}
return { name = { "PolyStakeChips" }, items = { wrath } }
