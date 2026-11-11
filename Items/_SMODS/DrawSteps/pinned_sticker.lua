local pinned_sticker = {
	object_type = "DrawStep",
	key = "pinned_sticker",
	order = 41,
	func = function(self, layer)
		for k, v in pairs(SMODS.Stickers) do
			if self.pinned and v.key == "pinned" then
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
	end,
	conditions = { vortex = false, facing = "front" },
}

return { name = { "DrawSteps" }, items = { pinned_sticker } }
