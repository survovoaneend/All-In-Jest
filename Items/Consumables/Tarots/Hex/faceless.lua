local faceless = {
	object_type = "Consumable",
	key = "faceless",
	set = "aij_hex_tarot",
	pos = { x = 3, y = 8 },
	set_card_type_badge = function(self, card, badges)
		badges[#badges + 1] = create_badge(localize("k_tarot_hex"), HEX("4f6367"), G.C.WHITE, 1.2)
	end,
	cost = 6,
	unlocked = true,
	discovered = false,
	hidden = true,
	soul_rate = 0.003 / 5,
	soul_set = "Tarot",
	order = 504,
	config = {},
	attributes = { "destroy_card", "generation", "joker", "editions", "negative", "rarity" },
	atlas = "consumable_atlas",
	loc_vars = function(self, info_queue, card) end,
	can_use = function(self, card)
		if G.jokers and #G.jokers.cards >= 1 and not SMODS.is_eternal(G.jokers.cards[1]) then
			return true
		end
	end,
	use = function(self, card)
		local rarity = G.jokers.cards[1].config.center.rarity
		SMODS.destroy_cards(G.jokers.cards[1])
		if rarity > 1 then
			local rarity_table = { [1] = 0, [2] = 0.6, [3] = 0.9, [4] = 1 }
			local _rarity = rarity_table[rarity]
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.2,
				func = function()
					card:juice_up()
					SMODS.add_card({
						set = "Joker",
						area = G.jokers,
						no_edition = true,
						rarity = _rarity,
						key_append = "faceless",
						edition = { negative = true },
					})
					return true
				end,
			}))
		else
			return { message = localize("k_nope_ex"), colour = HEX("4f6367") }
		end
	end,
}
return { name = { "Tarots" }, items = { faceless } }
