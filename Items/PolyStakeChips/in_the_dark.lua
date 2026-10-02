local in_the_dark = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 14,
	key = "in_the_dark",
	pos = { x = 7, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 500,
	stack = 3,
	points = { 50, 100, 200 },
	calculate = function(self, context)
		if context.setting_blind then
			G.GAME.aij_draw_face_down = G.GAME.aij_poly_chips[self.key]
		end
		if context.stay_flipped and G.GAME.aij_draw_face_down and G.GAME.aij_draw_face_down > 0 then
			G.GAME.aij_draw_face_down = G.GAME.aij_draw_face_down - 1
			return { stay_flipped = true }
		end
	end,
}
return { name = { "PolyStakeChips" }, items = { in_the_dark } }
