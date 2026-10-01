local demanding = {
	object_type = "Sticker",
	key = "demanding",
	config = { hand = "(poker hand)" },
	atlas = "stickers_atlas",
	order = 1,
	pos = { x = 1, y = 2 },
	badge_colour = HEX("55a383"),
	rate = 0.3,
	aij_calc_debuff = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability[self.key] and card.ability[self.key].hand or "(poker hand)" } }
	end,
	sets = { Joker = true },
	apply = function(self, card, val)
		SMODS.Sticker.apply(self, card, val)
		if card.ability[self.key] then
			card.ability[self.key].hand = pseudorandom_element(
				{ "Two Pair", "Three of a Kind", "Flush", "Straight" },
				pseudoseed("demanding_hand")
			)
		end
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not card.getting_sliced and not card.ability.debuff_sources["aij_demanding"] then
			SMODS.debuff_card(card, true, "aij_demanding", not card.debuff)
			return { message = localize("k_disabled_ex") }
		end
		if context.before and context.scoring_name == card.ability[self.key].hand then
			SMODS.debuff_card(card, nil, "aij_demanding")
			card:juice_up()
		end
	end,
}
return { name = { "Stickers" }, items = { demanding } }
