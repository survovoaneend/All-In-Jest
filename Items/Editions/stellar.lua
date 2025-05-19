local stellar_shader = {
    object_type = "Shader",
    key = 'stellar', 
    path = 'stellar.fs',
}
local stellar = {
    object_type = "Edition",
    key = 'stellar', 
    order = 2,
    config = { chips = 5, mult = 1 },
    loc_vars = function(self, info_queue)
        return {vars = {self.config.chips, self.config.mult}}
    end,
    calculate = function(self, card, context)
		if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            local chip = G.GAME.hands[context.scoring_name].level * G.P_CENTERS.e_aij_stellar.config.chips
            local mul = G.GAME.hands[context.scoring_name].level * G.P_CENTERS.e_aij_stellar.config.mult
			return {
				chips = chip,
				mult = mul
			}
		end
	end,
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,

    shader = 'stellar'
}
return {name = "Editions", items = {stellar, stellar_shader}}