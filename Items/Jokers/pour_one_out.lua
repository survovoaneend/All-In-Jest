local pour_one_out = {
	object_type = "Joker",
	order = 993,

	key = "pour_one_out",
	config = {
		extra = {
			discards = 15,
			discards_remaining = 15,
		},
	},
	attributes = { "generation", "consumable", "discard" },
	rarity = 2,
	pos = { x = 18, y = 46 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.discards,
				card.ability.extra.discards_remaining,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.discard and not context.blueprint then
			if card.ability.extra.discards_remaining <= 1 then
				G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
				card.ability.extra.discards_remaining = card.ability.extra.discards
				return {
					message = localize("k_aij_plus_consumable"),
					pre_func = function()
						G.E_MANAGER:add_event(Event({
							trigger = "before",
							delay = 0.0,
							func = function()
								SMODS.add_card({
									set = "Consumeables",
									area = G.consumeables,
									key_append = "pour_one_out",
								})
								G.GAME.consumeable_buffer = 0
								return true
							end,
						}))
					end
				}
			else
				card.ability.extra.discards_remaining = card.ability.extra.discards_remaining - 1
			end
		end
	end,
}
return { name = { "Jokers" }, items = { pour_one_out } }
