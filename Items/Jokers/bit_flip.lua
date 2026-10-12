local bit_flip = {
	object_type = "Joker",
	order = 965,

	key = "bit_flip",
	config = {
		extra = {
			odds = 2,
			score_mod = 1,
		},
	},
	attributes = { "chance", "score" },
	rarity = 1,
	pos = { x = 14, y = 44 },
	atlas = "joker_atlas",
	cost = 4,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
		return {
			vars = {
				numerator,
				denominator,
				card.ability.extra.score_mod,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.all_in_jest and context.all_in_jest.before_round_end_check and context.total_chips > 0 then
			local number_of_digits = math.floor(math.log10(context.total_chips + G.GAME.chips)) + 1
			local scientific_notation = false
			local chips_text = number_format(context.total_chips + G.GAME.chips)

			local to_number = Big and Big.to_number or function(x)
				return x
			end
			local number_of_digits = to_number(number_of_digits)

			-- If number is high enough to not show every digit, then skip the +score animation
			-- For balance sake the unseen digits are still modified, though they are unlikely to have much effect
			if string.find(chips_text, "e") then
				scientific_notation = true
			end
			local show_animation_threshold = 0
			if scientific_notation then
				show_animation_threshold = number_of_digits - 3
			end

			for i = 0, number_of_digits - 1 do
				if SMODS.pseudorandom_probability(card, "bit_flip", 1, card.ability.extra.odds) then
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						func = function()
							G.GAME.chips = G.GAME.chips + 10 ^ i
							return true
						end,
					}))
					if i >= show_animation_threshold then
						card_eval_status_text(card, "jokers", nil, percent, nil, {
							message = localize({ type = "variable", key = "a_score", vars = { SMODS.signed(10 ^ i) } }),
							update_score = true,
							volume = 0.5,
							sound_override = "gong",
							colour = G.C.PURPLE,
						})
					end
				else
					if i >= show_animation_threshold then
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							func = function()
								G.E_MANAGER:add_event(Event({
									trigger = "after",
									delay = 0.06 * G.SETTINGS.GAMESPEED,
									blockable = false,
									blocking = false,
									func = function()
										play_sound("tarot2", 0.76, 0.4)
										return true
									end,
								}))
								play_sound("tarot2", 1, 0.4)
								return true
							end,
						}))
						card_eval_status_text(card, "jokers", nil, percent, nil, {
							message = localize("k_nope_ex"),
							colour = G.C.PURPLE,
						})
					end
				end
			end

			return nil, true
		end
	end,
}
return { name = { "Jokers" }, items = { bit_flip } }
