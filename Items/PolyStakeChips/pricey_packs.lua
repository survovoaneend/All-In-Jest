local pricey_packs = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 12,
	key = "pricey_packs",
	pos = { x = 9, y = 0 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 300,
	stack = 1,
	points = { 150 },
	apply = function(self, stack)
		G.GAME.modifiers.booster_ante_scaling = true
	end,
}
return { name = { "PolyStakeChips" }, items = { pricey_packs } }
