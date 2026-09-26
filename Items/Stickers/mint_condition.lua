local mint_condition = {
	object_type = "Sticker",
	key = "mint_condition",
	config = { extra = {} },
	atlas = "stickers_atlas",
	order = 2,
	pos = { x = 3, y = 1 },
	badge_colour = HEX("d56f7e"),
	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,
	sets = { Joker = true },
	rental_compat = false,
	should_apply = function(self, card, center, area)
		if
			G.GAME.modifiers.aij_enable_mint_condition
			and card.ability
			and card.ability.set == "Joker"
			and ((area == G.shop_jokers) or (area == G.pack_cards))
			and pseudorandom("aij_mint_apply") < 0.1
		then
			return true
		end
		return false
	end,
	apply = function(self, card, val)
		card.ability[self.key] = val
		if card.ability[self.key] then
			card:set_cost()
		end
		SMODS.Sticker.apply(self, card, val)
	end,
}
SMODS.Stickers["rental"].aij_mint_condition_compat = false
return { name = { "Stickers" }, items = { mint_condition } }
