SMODS.DrawStep {
    key = 'chaotic_shader',
    order = 15,
    func = function(self, layer)
        if self.ability.jest_chaotic_card ~= nil and self.ability.jest_chaotic_card then
            self.children.front:draw_shader('aij_chaotic', nil, self.ARGS.send_to_shader)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}