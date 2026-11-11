local extra_floating_sprites = {
	object_type = "DrawStep",
	key = "extra_floating_sprites",
	order = 61,
	func = function(self)
		if self.config.center and self.config.center.all_in_jest and self.config.center.all_in_jest.soul_layers then
			for k, v in pairs(self.config.center.all_in_jest.soul_layers) do
				local scale_mod = self.config.center.all_in_jest.soul_layers[k].moving
						and 0.07 + 0.02 * math.cos(1.8 * G.TIMERS.REAL) + 0.00 * math.cos(
							(G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14
						) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
					or 0.07
				local rotate_mod = self.config.center.all_in_jest.soul_layers[k].moving
						and 0.05 * math.cos(1.219 * G.TIMERS.REAL) + 0.00 * math.cos(G.TIMERS.REAL * math.pi * 5) * (1 - (G.TIMERS.REAL - math.floor(
							G.TIMERS.REAL
						))) ^ 2
					or 0
				if self.children[k] then
					self.children[k]:draw_shader(
						"dissolve",
						0,
						nil,
						nil,
						self.children.center,
						scale_mod,
						rotate_mod,
						nil,
						self.config.center.all_in_jest.soul_layers[k].moving
								and 0.1 + 0.03 * math.cos(1.8 * G.TIMERS.REAL)
							or 0.1,
						nil,
						0.6
					)
					self.children[k]:draw_shader("dissolve", nil, nil, nil, self.children.center, scale_mod, rotate_mod)
				else
					local center = self.config.center
					self.children[k] = SMODS.create_sprite(
						self.T.x,
						self.T.y,
						self.T.w,
						self.T.h,
						center.all_in_jest.soul_layers[k].atlas or center.atlas or center.set,
						center.all_in_jest.soul_layers[k].pos
					)
					self.children[k].role.draw_major = self
					self.children[k].states.hover.can = false
					self.children[k].states.click.can = false
				end
				if not SMODS.draw_ignore_keys[k] then
					SMODS.draw_ignore_keys[k] = true
				end
			end
		end
	end,
	conditions = { vortex = false, facing = "front" },
}

return { name = { "DrawSteps" }, items = { extra_floating_sprites } }
