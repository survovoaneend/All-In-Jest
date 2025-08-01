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
        if G.GAME then
            if G.GAME.selected_back.effect.center.key ~= 'b_plasma' then
                return G.GAME.jest_fairy_edition_rate * self.weight
            end
        end
        return 0
    end,
    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.selected_back.effect.center.key ~= 'b_plasma' then
                return true
            end
        end
        return false
    end,

    shader = 'glimmer'
}
return {name = "Editions", items = {glimmer, glimmer_shader}}