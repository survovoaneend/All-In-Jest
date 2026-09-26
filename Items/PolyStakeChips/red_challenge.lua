local red_challenge = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 5,
	key = "red_challenge",
	pos = { x = 5, y = 0 },
	atlas = "chips_atlas",
	stack = 1,
	points = { 100 },
	apply = function(self, stack)
		G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
		G.GAME.modifiers.no_blind_reward.Small = true
	end,
}
return { name = { "PolyStakeChips" }, items = { red_challenge } }
