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