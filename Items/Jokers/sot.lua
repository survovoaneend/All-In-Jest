local sot = {
	object_type = "Joker",
	order = 231,

	key = "sot",
	config = {
		extra = { modxmult = 0.5, curxmult = 1 },
	},
	attributes = { "xmult", "tag" },
	rarity = 2,
	pos = { x = 15, y = 8 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		card.ability.extra.curxmult = 1
		for i = 1, #G.GAME.tags do
			card.ability.extra.curxmult = card.ability.extra.curxmult + card.ability.extra.modxmult
		end
		return { vars = { card.ability.extra.modxmult, card.ability.extra.curxmult } }
	end,

	calculate = function(self, card, context)
		if context.prevent_tag_trigger and not card.getting_sliced then
			return { prevent_trigger = true }
		end
		if context.joker_main then
			card.ability.extra.curxmult = 1
			for i = 1, #G.GAME.tags do
				card.ability.extra.curxmult = card.ability.extra.curxmult + card.ability.extra.modxmult
			end
			if card.ability.extra.curxmult ~= 1 then
				return {
					xmult = card.ability.extra.curxmult,
				}
			end
		end
	end,

	remove_from_deck = function(self, card, from_debuff)
		card.getting_sliced = true
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.STATE == G.STATES.BLIND_SELECT or G.TAROT_INTERRUPT == G.STATES.BLIND_SELECT then
					for _, tag in ipairs(G.GAME.tags) do
						tag:apply_to_run({ type = "immediate" })
					end
					for _, tag in ipairs(G.GAME.tags) do
						if tag:apply_to_run({ type = "new_blind_choice" }) then
							break
						end
					end
				end
				return true
			end,
		}))
	end,
}
return { name = { "Jokers" }, items = { sot } }
