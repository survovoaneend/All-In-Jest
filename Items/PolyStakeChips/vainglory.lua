local vainglory = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 21,
	key = "vainglory",
	pos = { x = 0, y = 2 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 900,
	stack = 1,
	points = { 50 },
	apply = function(self, stack)
		G.GAME.modifiers.enable_aij_suit_face = true
	end,
}
return { name = { "PolyStakeChips" }, items = { vainglory } }
