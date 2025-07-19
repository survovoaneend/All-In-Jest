local silver_shader = {
    object_type = "Shader",
    key = 'silver', 
    path = 'silver.fs',
}
SMODS.Sound {
  key = 'silver',
  path = 'glimmer.mp3'
}
local silver = {
    object_type = "Edition",
    key = 'silver', 
    sound = {
        sound = 'aij_silver',
        per = 1,
        vol = 1
    },
    order = 1,
    config = { },
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
		
	end,
    in_shop = true,
    weight = 3,
    extra_cost = 3,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,

    shader = 'silver'
}
return {name = "Editions", items = {silver, silver_shader}}