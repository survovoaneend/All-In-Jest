local star_magi_tarot = {
    object_type = "Consumable",
	key = 'star_magi',
	set = 'Tarot',
	pos = { x = 12, y = 8 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 16,
	config = { },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = {key = 'aij_astral_passigrade', set = 'Other'}
		return {
			vars = {
				
			}
		}
	end,
	can_use = function(self, card, area, copier)
		if #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables then
			return true
		end
	end,
	use = function(self, card)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.4,
			func = function()
				local new_card = create_card('aij_astral', G.consumeables, nil, nil, nil, nil, nil, 'jest_star_magi')
				G.consumeables:emplace(new_card)
				new_card.ability.consumeable.grade = 'Passigrade'
				return true
			end
		}))
	end,
}
return {name = {"Tarots"}, items = {star_magi_tarot}}