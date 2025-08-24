local aureate_shader = {
    object_type = "Shader",
    key = 'aureate', 
    path = 'aureate.fs',
}
SMODS.Sound {
  key = 'aureate',
  path = 'glimmer.mp3'
}
local aureate = {
    object_type = "Edition",
    key = 'aureate', 
    sound = {
        sound = 'aij_aureate',
        per = 1,
        vol = 1
    },
    order = 3,
    config = { 
        money = 0.3,
        max = 30
    },
    loc_vars = function(self, info_queue, card)
        local money = ((card.edition or {}).money or self.config.money) + 1
        return {
            vars = {
                money,
                (card.edition or {}).max or self.config.max
            }
        }
    end,
    calculate = function(self, card, context)
		if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            local money = ((card.edition or {}).money or self.config.money) + 1
            local max = (card.edition or {}).max or self.config.max
            if (G.GAME.dollars*money)-G.GAME.dollars > 0 then
			    return {
                    dollars = math.floor(math.min((G.GAME.dollars*money)-G.GAME.dollars, max)),
                }
            end
		end
	end,
    in_shop = true,
    weight = 3,
    extra_cost = 10,
    get_weight = function(self)
        return self.weight
    end,

    shader = 'aureate'
}
return {name = "Editions", items = {aureate, aureate_shader}}