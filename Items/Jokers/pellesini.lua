local pellesini = {
	object_type = "Joker",
	order = 1007,

	key = "pellesini",
	config = {},
	rarity = 4,
	unlock_condition = { hidden = true },
	pos = { x = 6, y = 0 },
	atlas = "legendary_atlas",
	cost = 20,
	unlocked = false,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	soul_pos = { x = 6, y = 1 },

	loc_vars = function(self, info_queue, card) end,

	calculate = function(self, card, context)
		if context.joker_type_destroyed then
			local other_card = context.card
			if other_card.ability.set == "Joker" then
                -- Subtract one since a joker is being destroyed
                -- Also account for if destroyed card is negative or similar
				if (#G.jokers.cards + G.GAME.joker_buffer - 1) < (G.jokers.config.card_limit + other_card.ability.card_limit) then
					local juiced_card = context.blueprint_card or card
                    if other_card.ability.card_limit <= 0 then
					    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    end
					G.E_MANAGER:add_event(Event({
						func = function()
							local temp_card = copy_card(other_card, nil, nil, nil, false)
							temp_card:add_to_deck()
							G.jokers:emplace(temp_card)
							temp_card:start_materialize()
							G.GAME.joker_buffer = 0
							if juiced_card == other_card then
								temp_card:juice_up(0.6, 0.1)
							else
								juiced_card:juice_up(0.6, 0.1)
							end
							return true
						end,
					}))
					return nil, true
				end
			end
		end
	end,
}

return { name = { "Jokers" }, items = { pellesini } }
