local double_threat = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 18,
	key = "double_threat",
	pos = { x = 1, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 1100,
	stack = 1,
	points = { 300 },
	apply = function(self, stack)
		G.GAME.aij_has_big_boss = true
		G.GAME.round_resets.blind_choices.Big_Boss = SMODS.get_new_blind("boss")
		G.GAME.round_resets.blind_tags.Big_Boss = get_next_tag_key()
	end,
}
return { name = { "PolyStakeChips" }, items = { double_threat } }
