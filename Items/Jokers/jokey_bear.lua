local jokey_bear = {
	object_type = "Joker",
	order = 529,

	key = "jokey_bear",
	config = {
		extra = {
			dollars = 3,
		},
	},
	attributes = { "xmult", "economy", "retrigger" },
	rarity = 2,
	pos = { x = 20, y = 24 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				0.75,
				card.ability.extra.dollars,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.all_in_jest and context.all_in_jest.before_after then
			if context.total_chips >= G.GAME.blind.chips then
				return {
					x_mult = 0.75,
					dollars = card.ability.extra.dollars,
				}
			end
		end
		if
			context.retrigger_joker_check
			and context.other_card == card
			and context.other_context.all_in_jest
			and context.other_context.all_in_jest.before_after
		then
			-- local to_number = Big and Big.to_number or function(x)
			-- 	return tonumber(x)
			-- end
			local chip_amt = SMODS.calculate_round_score()
			chip_amt = chip_amt * 0.75
			local reps = 0
			-- while chip_amt >= G.GAME.blind.chips do
			-- 	reps = reps + 1
			-- 	chip_amt = chip_amt * 0.75
			-- end

			-- Doing some cheeky logarithms to avoid a while loop
			-- Essentially, we're solving for reps in:
			-- chips_amount * 0.75 ^ reps < G.GAME.blind.chips
			-- Which, thanks to logarithm quotient rule, comes to:
			-- reps = log_0.75(G.GAME.blind.chips / chips_amount) = log_0.75(G.GAME.blind.chips) - log_0.75(chips_amount)
			-- Using logarithm quotient rule to avoid diving numbers, which can get funky with floating points
			reps = math.log(G.GAME.blind.chips, 0.75) - math.log(chip_amt, 0.75)
			reps = math.ceil(reps)

			if reps > 0 then
				return {
					repetitions = reps,
					card = card,
					message = localize("k_again_ex"),
				}
			end
		end
	end,
}
return { name = { "Jokers" }, items = { jokey_bear } }
