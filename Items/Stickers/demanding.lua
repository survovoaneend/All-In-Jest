local demanding = {
	object_type = "Sticker",
	key = "demanding",
	config = { hand = "(poker hand)", extra = { hands = { "Two Pair", "Three of a Kind", "Flush", "Straight" } } },
	atlas = "stickers_atlas",
	order = 1,
	pos = { x = 1, y = 2 },
	badge_colour = HEX("55a383"),
	rate = 0.3,
	aij_calc_debuff = true,
	loc_vars = function(self, info_queue, card)
		local key = self.key
		if
			G.GAME.all_in_jest
			and G.GAME.all_in_jest.sticker_effects
			and G.GAME.all_in_jest.sticker_effects["aij_demanding"].active
		then
			key = self.key .. "_alt"
		end
		return { key = key, vars = { card.ability[self.key] and card.ability[self.key].hand or "(poker hand)" } }
	end,
	sets = { Joker = true },
	should_apply = function(self, card, center, area, bypass_roll)
		if area == G.shop_jokers or area == G.pack_cards then
			return SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
		end
		return false
	end,
	apply = function(self, card, val)
		SMODS.Sticker.apply(self, card, val)
		if card.ability[self.key] then
			card.ability[self.key].hand = pseudorandom_element(
				G.GAME.all_in_jest.sticker_effects["aij_demanding"].hands,
				pseudoseed("demanding_hand")
			)
		end
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not card.getting_sliced and not card.ability.debuff_sources["aij_demanding"] then
			SMODS.debuff_card(card, true, "aij_demanding", not card.debuff)
			return { message = localize("k_disabled_ex") }
		end
		if context.before then
			-- If this has been nerfed by sticker sheet
			if
				G.GAME.all_in_jest
				and G.GAME.all_in_jest.sticker_effects
				and G.GAME.all_in_jest.sticker_effects["aij_demanding"].active
			then
				if next(context.poker_hands[card.ability[self.key].hand]) then
					SMODS.debuff_card(card, nil, "aij_demanding")
					card:juice_up()
				end
			else
				-- Standard effect
				if context.scoring_name == card.ability[self.key].hand then
					SMODS.debuff_card(card, nil, "aij_demanding")
					card:juice_up()
				end
			end
		end
	end,
}
return { name = { "Stickers" }, items = { demanding } }
