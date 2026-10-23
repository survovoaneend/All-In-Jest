local vanha_erkki = {
	object_type = "Joker",
	order = 699,

	key = "vanha_erkki",
	config = {
		extra = {
			chosen_timing = "joker_main",
			xmult = 3,
		},
	},
	attributes = { "xmult" },
	rarity = 3,
	pos = { x = 0, y = 32 },
	atlas = "joker_atlas",
	cost = 8,
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
		if context.before and not context.blueprint then
			-- Make during_cards and joker_main more likely to average things out
			local possible_timings = {
				"before",
				"during_cards",
				"during_cards",
				"during_cards",
				"during_cards",
				"joker_main",
				"joker_main",
				"joker_main",
				"joker_main",
				"after_jokers",
			}
			card.ability.extra.chosen_timing =
				pseudorandom_element(possible_timings, "vanha_erkki_" .. G.GAME.round_resets.ante)
			card.ability.extra.chosen_timing_after = nil

			if card.ability.extra.chosen_timing == "during_cards" then
				card.ability.extra.chosen_timing_after =
					pseudorandom_element(context.scoring_hand, "vanha_erkki_" .. G.GAME.round_resets.ante)
			elseif card.ability.extra.chosen_timing == "joker_main" then
				card.ability.extra.chosen_timing_after =
					pseudorandom_element(G.jokers.cards, "vanha_erkki_" .. G.GAME.round_resets.ante)
			end
		end

		-- 1. Before cards score
		if context.initial_scoring_step and card.ability.extra.chosen_timing == "before" then
			return {
				xmult = card.ability.extra.xmult,
			}
		end

		-- 2. After cards score, but before Jokers trigger
		if
			context.individual
			and context.cardarea == G.play
			and context.other_card == card.ability.extra.chosen_timing_after
			and not context.other_card.repetition_trigger
			and card.ability.extra.chosen_timing == "during_cards"
		then
			card.ability.extra.chosen_timing_after = nil
			return {
				no_juice = true,
				card = card,
				message_card = card,
				juice_card = card,
				x_mult = card.ability.extra.xmult,
			}
		end

		-- -- 2. After cards score, but before Jokers trigger
		-- if
		-- 	context.all_in_jest
		-- 	and context.all_in_jest.after_scoring_cards
		-- 	and card.ability.extra.chosen_timing == "after_cards"
		-- then
		-- 	return {
		-- 		x_mult = card.ability.extra.xmult,
		-- 	}
		-- end

		-- 3. In the main Joker scoring cycle
		if
			context.other_joker
			and context.other_joker == card.ability.extra.chosen_timing_after
			and card.ability.extra.chosen_timing == "joker_main"
		then
			card.ability.extra.chosen_timing_after = nil
			return {
				no_juice = true,
				card = card,
				message_card = card,
				juice_card = card,
				xmult = card.ability.extra.xmult,
			}
		end

		-- -- 3. In the main Joker scoring cycle
		-- if context.joker_main and card.ability.extra.chosen_timing == "joker_main" then
		-- 	return {
		-- 		xmult = card.ability.extra.xmult,
		-- 	}
		-- end

		-- 4. After all Jokers have trigger
		if context.final_scoring_step and card.ability.extra.chosen_timing == "after_jokers" then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
	end,
}
return { name = { "Jokers" }, items = { vanha_erkki } }
