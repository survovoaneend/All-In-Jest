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
	rate = 0.1,
	should_apply = function(self, card, center, area, bypass_roll)
		if area == G.shop_jokers then -- no packs
			return SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
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
local set_rental_ref = Card.set_rental
function Card:set_rental(_rental)
	if self.ability.aij_mint_condition then _rental = false end
	set_rental_ref(self, _rental)
end
return { name = { "Stickers" }, items = { mint_condition } }
