local glimmer_shader = {
    object_type = "Shader",
    key = 'glimmer', 
    path = 'glimmer.fs',
}
local glimmer = {
    object_type = "Edition",
    key = 'glimmer', 
    ignore = true,
    order = 0,
    config = { percent = 10 },
    loc_vars = function(self, info_queue)
        return {vars = {self.config.percent}}
    end,
    calculate = function(self, card, context)
		if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
			balance_percent(card, (G.P_CENTERS.e_aij_glimmer.config.percent*0.01))
		end
	end,
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,

    shader = 'glimmer'
}
return {name = "Editions", items = {glimmer, glimmer_shader}}