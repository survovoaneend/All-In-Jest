local chaotic_shader = {
	object_type = "DrawStep",
	key = "chaotic_shader",
	order = 15,
	func = function(self, layer)
		if self.ability.aij_jest_chaotic_card ~= nil and self.ability.aij_jest_chaotic_card then
			self.children.center:draw_shader("aij_chaotic", nil, self.ARGS.send_to_shader)
			if self.children.front and (self.ability.delayed or not self:should_hide_front()) then
				self.children.front:draw_shader("aij_chaotic", nil, self.ARGS.send_to_shader)
			end
		end
	end,
	conditions = { vortex = false, facing = "front" },
}

return { name = { "DrawSteps" }, items = { chaotic_shader } }
