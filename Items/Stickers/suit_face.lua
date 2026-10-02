local suit_face = {
	object_type = "Sticker",
	key = "suit_face",
	config = { extra = {} },
	atlas = "stickers_atlas",
	order = 5,
	no_collection = true,
	pos = { x = 2, y = 2 },
	badge_colour = HEX("5c6284"),
	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,
	sets = { Joker = true },
	rate = 0.3,
	should_apply = function(self, card, center, area, bypass_roll)
		local result = false
		if area == G.shop_jokers or area == G.pack_cards then
			result = SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
		end
		if result then
			local stickers = { "aij_spade", "aij_heart", "aij_club", "aij_diamond" }
			if not SMODS.has_attribute(center, "face") then
				table.insert(stickers, "aij_face")
			end
			card.ability.aij_suit_sticker_choice = pseudorandom_element(stickers, pseudoseed("aij_suit_sticker"))
		end
		return false
	end,
}
return { name = { "Stickers" }, items = { suit_face } }
