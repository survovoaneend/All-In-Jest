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
    pools = {
        seal_edition_pool = true
    },
    order = 2,
    config = { chips = 5, mult = 1 },
    aij_seal_config = { hands = 2 }, --Prevents other vaules from being halfed by seal editions
    loc_vars = function(self, info_queue, card)
        return {vars = {(card.edition or {}).chips or self.config.chips, (card.edition or {}).mult or self.config.mult, (card.aij_seal_edition or {}).hands or self.aij_seal_config.hands}}
    end,
    calculate = function(self, card, context)
		if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            local level = context.calculate_seal_edition and math.floor(to_number(G.GAME.hands[context.scoring_name].level)/2) or to_number(G.GAME.hands[context.scoring_name].level)
            local chip = level * card.edition.chips
            local mul = level * card.edition.mult
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
        return G.GAME.jest_fairy_edition_rate * self.weight
    end,

    shader = 'stellar'
}
return {name = "Editions", items = {stellar, stellar_shader}}