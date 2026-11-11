local crimson_heart = {
	object_type = "Blind",
	key = "crimson_heart_GL",
	boss = {
		showdown = true,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "joker", "debuff" },
	boss_colour = HEX("ac3232"),
	pos = { x = 0, y = 25 },
	order = 54,
	dollars = 8,

	calculate = function(self, blind, context)
		if context.blind_disabled or context.blind_defeated then
			for _, joker in ipairs(G.jokers.cards) do
				if joker.ability.aij_crimson_heart_GL then
					joker.ability.aij_crimson_heart_GL = nil
					SMODS.recalc_debuff(joker)
				end
			end
		end

		if blind.disabled then
			return
		end

		if
			context.debuff_card
			and context.debuff_card.area == G.jokers
			and context.debuff_card.ability.aij_crimson_heart_GL
		then
			return { debuff = true }
		end

		if context.press_play and G.jokers.cards[1] then
			blind.triggered = true
			blind.prepped = true
		end

		if context.hand_drawn then
			if blind.prepped then
				local pool = {}
				for _, joker in ipairs(G.jokers.cards) do
					if not joker.debuff and not joker.ability.aij_crimson_heart_GL then
						pool[#pool + 1] = joker
					end
				end
				local chosen = pseudorandom_element(pool, pseudoseed("crimson_heart_GL"))
				if chosen then
					chosen.ability.aij_crimson_heart_GL = true
					SMODS.recalc_debuff(chosen)
					chosen:juice_up()
					blind:wiggle()
				end
			end
			blind.prepped = nil
		end
	end,
}
return { name = { "Finisher Blinds" }, items = { crimson_heart } }
