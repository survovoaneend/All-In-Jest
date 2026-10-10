local mr_lonely = {
	object_type = "Joker",
	order = 210,
	lite = true,
	key = "mr_lonely",
	config = {
		extra = {
			chips = 0,
			chip_mod = 10,
		},
	},
	attributes = { "chips", "scaling", "joker_slot" },
	rarity = 2,
	pos = { x = 18, y = 7 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chip_mod,
				card.ability.extra.chips,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.end_of_round and context.main_eval and not context.blueprint then
			if (G.jokers.config.card_limit - #G.jokers.cards - G.GAME.joker_buffer) > 0 then
				SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = "chips",
					scalar_value = "chip_mod",
					operation = function(ref_table, ref_value, initial, change)
						ref_table[ref_value] = initial + change * (G.jokers.config.card_limit - #G.jokers.cards - G.GAME.joker_buffer)
					end,
					no_message = true,
				})
			end

			if (G.jokers.config.card_limit - #G.jokers.cards - G.GAME.joker_buffer) > 0 then
				return {
					message = localize("k_upgrade_ex"),
					card = card,
				}
			end
		end
		if context.joker_main and card.ability.extra.chips > 0 then
			return {
				chips = card.ability.extra.chips,
			}
		end
	end,
}
return { name = { "Jokers" }, items = { mr_lonely } }
