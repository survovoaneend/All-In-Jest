local broken_foot = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 10,
	key = "broken_hand",
	pos = { x = 6, y = 0 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 100,
	stack = 2,
	points = { 200, 400 },
	apply = function(self, stack)
		G.GAME.starting_params.hands = G.GAME.starting_params.hands - stack
		G.GAME.round_resets.hands = G.GAME.starting_params.hands
		G.GAME.current_round.hands_left = G.GAME.starting_params.hands
	end,
}
return { name = { "PolyStakeChips" }, items = { broken_foot } }
