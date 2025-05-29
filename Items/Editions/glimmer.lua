local glimmer_shader = {
    object_type = "Shader",
    key = 'glimmer', 
    path = 'glimmer.fs',
}
SMODS.Sound {
  key = 'glimmer',
  path = 'glimmer.mp3'
}
local glimmer = {
    object_type = "Edition",
    key = 'glimmer', 
    sound = {
        sound = 'aij_glimmer',
        per = 1,
        vol = 1
    },
    order = 0,
    config = { percent = 10 },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.edition.percent}}
    end,
    calculate = function(self, card, context)
		if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
			balance_percent(card, (card.edition.percent*0.01))
		end
	end,
    in_shop = true,
    weight = 3,
    extra_cost = 3,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,

    shader = 'glimmer'
}
return {name = "Editions", items = {glimmer, glimmer_shader}}