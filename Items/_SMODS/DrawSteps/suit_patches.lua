local suit_patches = {
	object_type = "DrawStep",
	key = "suit_patches",
	order = 21,
	func = function(self, layer)
		--Patches
		if self.ability.patches then
			for k, v in pairs(self.ability.patches) do
				if G.all_in_jest.patches_sprites["hc_" .. k] and G.SETTINGS.colour_palettes[k] == "hc" then
					G.all_in_jest.patches_sprites["hc_" .. k].role.draw_major = self
					G.all_in_jest.patches_sprites["hc_" .. k]:draw_shader(
						"dissolve",
						nil,
						nil,
						nil,
						self.children.center
					)
				elseif G.all_in_jest.patches_sprites[k] then
					G.all_in_jest.patches_sprites[k].role.draw_major = self
					G.all_in_jest.patches_sprites[k]:draw_shader("dissolve", nil, nil, nil, self.children.center)
				else
					G.all_in_jest.patches_sprites["Other"].role.draw_major = self
					G.all_in_jest.patches_sprites["Other"]:draw_shader("dissolve", nil, nil, nil, self.children.center)
				end
			end
		end
	end,
	conditions = { vortex = false, facing = "front" },
}

return { name = { "DrawSteps" }, items = { suit_patches } }
