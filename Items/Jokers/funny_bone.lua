local funny_bone = {
	object_type = "Joker",
	order = 519,
	key = "funny_bone",
	config = {
		extra = {},
	},
	attributes = { "generation", "tarot", "consumable", "on_sell", "on_destroy" },
	rarity = 2,
	pos = { x = 12, y = 24 },
	atlas = "joker_atlas",
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,

	calculate = function(self, card, context)
		if
			context.selling_card
			and (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit
		then
			local sold_card = context.card
			if sold_card.ability.set == "Joker" then
				G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
				G.E_MANAGER:add_event(Event({
					func = function()
						SMODS.add_card({
							set = "Tarot",
							key_append = "funny_bone",
						})
						G.GAME.consumeable_buffer = 0
						return true
					end,
				}))
				return {
					message = localize("k_plus_tarot"),
				}
			end
		end
		if context.aij_after_destroying_cards then
			for _, destroyed_card in ipairs(context.removed) do
				if destroyed_card.ability.set == "Joker" then
					if (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						G.E_MANAGER:add_event(Event({
							func = function()
								SMODS.add_card({
									set = "Tarot",
									key_append = "funny_bone",
								})
								G.GAME.consumeable_buffer = 0
								return true
							end,
						}))
						SMODS.calculate_effect(
							{ message = localize("k_plus_tarot"), colour = G.C.PURPLE },
							context.blueprint_card or card
						)
					end
				end
			end
			return nil, true
		end
	end,
}

return { name = { "Jokers" }, items = { funny_bone } }
