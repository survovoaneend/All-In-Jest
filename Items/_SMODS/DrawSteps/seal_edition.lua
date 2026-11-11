local seal_edition = {
	object_type = "DrawStep",
	key = "aij_seal_edition",
	order = 31,
	func = function(self, layer)
		local edition = self.aij_delay_seal_edition or self.aij_seal_edition
		if self.seal and edition then
			for k, v in pairs(G.P_CENTER_POOLS.Edition) do
				if edition.key == v.key and v.shader then
					if type(v.draw) == "function" then
						v:draw(self, layer)
					else
						G.shared_seals[self.seal]:draw_shader(
							v.shader,
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

return { name = { "DrawSteps" }, items = { seal_edition } }
