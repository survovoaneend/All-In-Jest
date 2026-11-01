local astral_grade_stickers = {
	object_type = "DrawStep",
	key = "astral_grade_stickers",
	order = 21,
	func = function(self, layer)
		if not (self.area and self.area.config.collection and not self.area.config.aij_card_select_collection) then
			for k, v in pairs(All_in_Jest.Astral_Grades) do
				if
					self.ability.astral_grade == v.key
					and not (self.aij_delay_sticker and self.aij_delay_sticker[v.key])
				then
					if v and v.draw and type(v.draw) == "function" then
						v:draw(self, layer)
					else
						G.shared_stickers[v.key].role.draw_major = self
						G.shared_stickers[v.key]:draw_shader("dissolve", nil, nil, nil, self.children.center)
						G.shared_stickers[v.key]:draw_shader(
							"voucher",
							nil,
							self.ARGS.send_to_shader,
							nil,
							self.children.center
						)
					end
				end
			end
		end
	end,
	conditions = { vortex = false, facing = "front" },
}

return { name = { "DrawSteps" }, items = { astral_grade_stickers } }
