local broken_fate = {
    object_type = "Consumable",
	key = 'broken_fate',
	set = 'Tarot',
	pos = { x = 6, y = 5 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 8,
	config = { },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		
	end,
	can_use = function(self, card, area, copier)
        if G.consumeables and #G.consumeables.cards > 0 and G.consumeables.cards[1].config.center.key ~= "c_aij_broken_fate" then
            return true 
        end
    end,
    use = function(self, card)
		local ran_amount = 0.75 + math.random(0, math.floor((2.5 - 0.75) / 0.05 + 0.5)) * 0.05
		local string = "X"..tostring(ran_amount)
        jest_ability_calculate(G.consumeables.cards[1],"*", ran_amount, nil ,nil, true, "ability.extra")
		card_eval_status_text(card, 'extra', nil, nil, nil, {message = string, colour = G.C.FILTER})
    end,
}
return {name = {"Tarots"}, items = {broken_fate}}