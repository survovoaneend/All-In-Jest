local jimbo_nameplate_tape = {
	object_type = "DrawStep",
	key = "jimbo_nameplate_tape",
	order = 1,
	func = function(self, layer)
		-- Guess the Jest Collection Hiding
		if
			self.config.center.rarity == 4
			and G.STATE == G.STATES.SMODS_BOOSTER_OPENED
			and SMODS.OPENED_BOOSTER
			and SMODS.OPENED_BOOSTER.config.center.key == "p_aij_guess_the_jest"
			and self.area
			and self.area.config.collection
		then
			if self.config.center.discovered or self.bypass_discovery_center then
				G.all_in_jest.extra_card_sprites["Jimbo_Nameplate_Tape"].role.draw_major = self
				G.all_in_jest.extra_card_sprites["Jimbo_Nameplate_Tape"]:draw_shader(
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

return { name = { "DrawSteps" }, items = { jimbo_nameplate_tape } }
