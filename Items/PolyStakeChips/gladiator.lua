local gladiator = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 23,
	key = "gladiator",
	pos = { x = 5, y = 1 },
	atlas = "chips_atlas",
    unlocked = false,
	point_requirement = 1000,
	stack = 1,
	points = { 500 },
    apply = function(self, stack)
        -- need to reroll it to use the correct pool
		G.GAME.round_resets.blind_choices.Boss = SMODS.get_new_blind("boss")
	end,
}
return { name = { "PolyStakeChips" }, items = { gladiator } }
