local stellar_shader = {
    object_type = "Shader",
    key = 'stellar', 
    path = 'stellar.fs',
}
SMODS.Sound {
  key = 'stellar',
  path = 'stellar.mp3'
}
local stellar = {
    object_type = "Edition",
    key = 'stellar', 
    sound = {
        sound = 'aij_stellar',
        per = 1,
        vol = 1
    },
    order = 2,
    config = { chips = 5, mult = 1 },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.edition.chips, card.edition.mult}}
    end,
    calculate = function(self, card, context)
		if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            local chip = G.GAME.hands[context.scoring_name].level * card.edition.chips
            local mul = G.GAME.hands[context.scoring_name].level * card.edition.mult
			return {
				chips = chip,
				mult = mul
			}
		end
	end,
    in_shop = true,
    weight = 10,
    extra_cost = 2,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,

    shader = 'stellar'
}
return {name = "Editions", items = {stellar, stellar_shader}}