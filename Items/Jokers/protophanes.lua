local protophanes = {
	object_type = "Joker",
	order = 767,

	key = "protophanes",
	config = {
		extra = {
			xmult = 1.5,
		},
		future_sense = "1",
	},
	attributes = { "future_sense", "xmult", "rank" },
	rarity = 2,
	pos = { x = 24, y = 46 },
	soul_pos = { x = 3, y = 47 },
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
				card.ability.extra.xmult,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and G.deck then
			local next_card = #G.deck.cards > 0 and G.deck.cards[1]
			if next_card and context.other_card:get_id() == next_card:get_id() then
				return {
					xmult = card.ability.extra.xmult,
				}
			end
		end
	end,
	generate_ui = function(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
		SMODS.Joker.super.generate_ui(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
		if G.deck ~= nil and cardd and cardd.area and cardd.area.config.type == "joker" then
			local cards = {}
			local old_paused = G.SETTINGS.paused
			G.SETTINGS.paused = true -- Best way I can think to pause calculations here, it's a bit jank
			if #G.deck.cards > 0 then
				local i = 1
				local card = copy_card(G.deck.cards[i], nil, nil, G.playing_card)

				-- Re-adds negative to preview if it was stripped by the mod
				if
					G.deck.cards[i].edition
					and G.deck.cards[i].edition.negative
					and not All_in_Jest.config.no_copy_neg
				then
					card:set_edition({ negative = true }, nil, true)
				end

				card.facing = "front"
				table.insert(cards, card)
			end
			AllInJest.card_area_preview(nil, desc_nodes, {
				override = true,
				cards = cards,
				w = 1.0,
				h = 0.4,
				ml = 0,
				scale = 0.4,
			})
			G.SETTINGS.paused = old_paused
		end
	end,
}
return { name = { "Jokers" }, items = { protophanes } }
