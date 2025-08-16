SMODS.DrawStep {
    key = 'chaotic_shader',
    order = 15,
    func = function(self, layer)
        if SMODS.get_enhancements(self).m_aij_wood then
            if not G.SETTINGS.colourblind_option and self.children.front then
                self.children.front:draw_shader('aij_wood', nil, self.ARGS.send_to_shader)
            end
            self.children.center:draw_shader('aij_semitrasparent', nil, self.ARGS.send_to_shader)
        end
        if self.ability.jest_chaotic_card ~= nil and self.ability.jest_chaotic_card then
            self.children.front:draw_shader('aij_chaotic', nil, self.ARGS.send_to_shader)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
SMODS.DrawStep {
    key = 'temp_patches',
    order = 34,
    func = function(self, layer)
        if self.ability.patches then
            for k, v in pairs(self.ability.patches) do
                if G.GAME.all_in_jest.patches_sprites[k] then
                    G.GAME.all_in_jest.patches_sprites[k].role.draw_major = self
                    G.GAME.all_in_jest.patches_sprites[k]:draw_shader('dissolve', nil, nil, nil, self.children.center)
                else
                    G.GAME.all_in_jest.patches_sprites['Other'].role.draw_major = self
                    G.GAME.all_in_jest.patches_sprites['Other']:draw_shader('dissolve', nil, nil, nil, self.children.center)
                end
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
} 
SMODS.DrawStep {
    key = 'wireframe_floating_sprite',
    order = 61,
    func = function(self)
        if self.config.center.soul_pos and (self.config.center.discovered or self.bypass_discovery_center) then
            local scale_mod = 0.07 + 0.02*math.sin(1.8*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
            local rotate_mod = 0.05*math.sin(1.219*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2

            if self.children.floating_sprite then
                if self.config.center.key == 'j_aij_wireframe' then
                    self.hover_tilt = self.hover_tilt*1.5
                    self.children.floating_sprite:draw_shader('hologram', nil, self.ARGS.send_to_shader, nil, self.children.center, 2*scale_mod, 2*rotate_mod)
                    self.hover_tilt = self.hover_tilt/1.5
                end
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}