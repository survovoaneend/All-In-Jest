local mark_of_the_spear = {
	object_type = "DrawStep",
	key = "mark_of_the_spear",
	order = 40,
	func = function(self, layer)
		--Mark of the Spear
		if self.ability and self.ability.all_in_jest and self.ability.all_in_jest.perma_debuff then
			if G.all_in_jest.extra_card_sprites["Mark_of_the_Spear"].role then
				G.all_in_jest.extra_card_sprites["Mark_of_the_Spear"].role.draw_major = self
				G.all_in_jest.extra_card_sprites["Mark_of_the_Spear"]:draw_shader(
					"dissolve",
					nil,
					nil,
					nil,
					self.children.center
				)
			end
		end
	end,
	conditions = { vortex = false, facing = "front" },
}

return { name = { "DrawSteps" }, items = { mark_of_the_spear } }
