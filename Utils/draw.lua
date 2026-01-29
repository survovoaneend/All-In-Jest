SMODS.DrawStep {
    key = 'chaotic_shader',
    order = 15,
    func = function(self, layer)
        if SMODS.get_enhancements(self).m_aij_wood then
            if not G.SETTINGS.colourblind_option and self.children.front and (self.ability.delayed or not self:should_hide_front()) then
                self.children.front:draw_shader('aij_wood', nil, self.ARGS.send_to_shader)
            end
            self.children.center:draw_shader('aij_semitrasparent', nil, self.ARGS.send_to_shader)
        end
        if self.ability.aij_jest_chaotic_card ~= nil and self.ability.aij_jest_chaotic_card then
            self.children.center:draw_shader('aij_chaotic', nil, self.ARGS.send_to_shader)
            if self.children.front and (self.ability.delayed or not self:should_hide_front()) then
                self.children.front:draw_shader('aij_chaotic', nil, self.ARGS.send_to_shader)
            end
        end
        if SMODS.get_enhancements(self).m_aij_scorched then
            self.children.center:draw_shader('aij_burnt', nil, self.ARGS.send_to_shader)
            if self.children.front and not self:should_hide_front() then
                self.children.front:draw_shader('aij_burnt', nil, self.ARGS.send_to_shader)
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
SMODS.DrawStep {
    key = 'temp_patches',
    order = 21,
    func = function(self, layer)
		--Patches
        if self.ability.patches then
            for k, v in pairs(self.ability.patches) do
                if G.all_in_jest.patches_sprites['hc_'..k] and G.SETTINGS.colour_palettes[k] == 'hc' then
                    G.all_in_jest.patches_sprites['hc_'..k].role.draw_major = self
                    G.all_in_jest.patches_sprites['hc_'..k]:draw_shader('dissolve', nil, nil, nil, self.children.center)
				        elseif G.all_in_jest.patches_sprites[k] then
                    G.all_in_jest.patches_sprites[k].role.draw_major = self
                    G.all_in_jest.patches_sprites[k]:draw_shader('dissolve', nil, nil, nil, self.children.center)
                else
                    G.all_in_jest.patches_sprites['Other'].role.draw_major = self
                    G.all_in_jest.patches_sprites['Other']:draw_shader('dissolve', nil, nil, nil, self.children.center)
                end
            end
        end
		--Mark of the Spear
        if self.ability and self.ability.all_in_jest and self.ability.all_in_jest.perma_debuff then
          if G.all_in_jest.extra_card_sprites['Mark_of_the_Spear'].role then
            G.all_in_jest.extra_card_sprites['Mark_of_the_Spear'].role.draw_major = self
            G.all_in_jest.extra_card_sprites['Mark_of_the_Spear']:draw_shader('dissolve', nil, nil, nil, self.children.center)
          end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
} 
SMODS.DrawStep {
    key = 'aij_seal_edition',
    order = 30,
    func = function(self, layer)
        local edition = self.aij_delay_seal_edition or self.aij_seal_edition
        if self.seal and edition then
            for k, v in pairs(G.P_CENTER_POOLS.Edition) do
                if edition[v.key:sub(3)] and v.shader then
                    if type(v.draw) == 'function' then
                        v:draw(self, layer)
                    else
                        G.shared_seals[self.seal]:draw_shader(v.shader, nil, self.ARGS.send_to_shader, nil, self.children.center)
                    end
                end
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
SMODS.DrawStep({
	key = "aij_extra_floating_sprites",
	order = 61,
	func = function(self)
		if self.config.center and self.config.center.all_in_jest and self.config.center.all_in_jest.soul_layers then
			for k, v in pairs(self.config.center.all_in_jest.soul_layers) do
				local scale_mod = self.config.center.all_in_jest.soul_layers[k].moving and 0.07 + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3 or 0.07
				local rotate_mod = self.config.center.all_in_jest.soul_layers[k].moving and 0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2 or 0
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
						self.config.center.all_in_jest.soul_layers[k].moving and 0.1 + 0.03*math.cos(1.8*G.TIMERS.REAL) or 0.1,
						nil,
						0.6
					)
					self.children[k]:draw_shader(
						"dissolve",
						nil,
						nil,
						nil,
						self.children.center,
						scale_mod,
						rotate_mod
					)
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
})
