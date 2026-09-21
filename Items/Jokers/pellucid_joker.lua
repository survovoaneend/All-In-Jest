
local create_editioned_playing_card = function(edition, juice_card)
	local new_card = create_playing_card({
		front = pseudorandom_element(G.P_CARDS, pseudoseed("pellucid_joker")),
		center = G.P_CENTERS.c_base,
	}, juice_card, true, nil, { G.C.SECONDARY_SET.Enhanced }, true)
	new_card:set_edition(edition)
	new_card:start_materialize()
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.3,
		func = function()
			G.deck:emplace(new_card)
			G.deck.config.card_limit = G.deck.config.card_limit + 1
			return true
		end,
	}))
	playing_card_joker_effects({ new_card })
end

local pellucid_joker = {
	object_type = "Joker",
	order = 145,

	key = "pellucid_joker",
	config = {},
	attributes = { "generation", "playing_card", "editions", "on_sell", "on_destroy" },
	rarity = 2,
	pos = { x = 11, y = 5 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card) end,

	calculate = function(self, card, context)
		if context.selling_card and (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
			local sold_card = context.card
			if sold_card.ability.set == "Joker" and sold_card.edition ~= nil then
				local juice_card = context.blueprint_card or card
				G.E_MANAGER:add_event(Event({
					func = function()
						create_editioned_playing_card(sold_card.edition, juice_card)
						return true
					end,
				}))
				return {
					message = "Test!"
				}
			end
		end
		if context.aij_after_destroying_cards then
			for _, destroyed_card in ipairs(context.removed) do
				if destroyed_card.ability.set == "Joker" and destroyed_card.edition ~= nil then
					local juice_card = context.blueprint_card or card
					G.E_MANAGER:add_event(Event({
						func = function()
							create_editioned_playing_card(destroyed_card.edition, juice_card)
							return true
						end,
					}))
					SMODS.calculate_effect(
						{ message = "Test!", colour = G.C.PURPLE }, juice_card
					)
				end
			end
			return nil, true
		end
	end,
}

return { name = { "Jokers" }, items = { pellucid_joker } }
