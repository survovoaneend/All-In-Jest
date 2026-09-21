local plain_packaging = {
	object_type = "Joker",
	order = 117,

	key = "plain_packaging",
	config = {
		extra = {
			mult = 20,
			mult_decrease = 5,
		},
	},
	attributes = { "mult", "scaling", "on_sell", "on_destroy" },
	rarity = 1,
	pos = { x = 9, y = 4 },
	atlas = "joker_atlas",
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult,
				card.ability.extra.mult_decrease,
			},
		}
	end,

	calculate = function(self, card, context)
		if (context.selling_card or context.aij_after_destroying_cards) and not context.blueprint then
			local times = 0
			if context.aij_after_destroying_cards then
				for _, v in ipairs(context.removed) do
					if v.ability.set == "Joker" then
						times = times + 1
					end
				end
			elseif context.selling_card then
				if context.card.ability.set == "Joker" then
					times = 1
				end
			end
			
			for _ = 1, times do
				if (card.ability.extra.mult - card.ability.extra.mult_decrease) <= 0 then
					SMODS.destroy_cards(card, nil, nil, true)
					return {
						message = localize("k_aij_empty_ex"),
						colour = G.C.FILTER,
					}
				else
					SMODS.scale_card(card, {
						ref_table = card.ability.extra,
						ref_value = "mult",
						scalar_value = "mult_decrease",
						operation = "-",
						message_key = "a_mult_minus",
						message_colour = G.C.MULT,
					})
				end
			end
			return nil, true
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
			}
		end
	end,
}
return { name = { "Jokers" }, items = { plain_packaging } }
