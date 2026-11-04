local polkadot = {
	object_type = "Voucher",
	key = "polkadot",
	config = {
		sticker_effects = nil,
	},
	attributes = { "stickers" },
	atlas = "vouchers_atlas",
	pos = { x = 5, y = 0 },
	discovered = false,
	order = 5,
	requires = {
		"v_aij_sticker_sheet",
	},

	in_pool = function(self, args)
		return G.GAME.modifiers.enable_perishables_in_shop
			or G.GAME.modifiers.enable_rentals_in_shop
			or G.GAME.modifiers.enable_aij_indecisive
			or G.GAME.modifiers.enable_aij_mint_condition
			or G.GAME.modifiers.enable_aij_demanding
	end,

	loc_vars = function(self, info_queue)
		return { vars = {} }
	end,

	redeem = function(self)
		if self.config.sticker_effects ~= G.GAME.all_in_jest.sticker_effects then
			self.config.sticker_effects = G.GAME.all_in_jest.sticker_effects
		end

		G.GAME.all_in_jest.sticker_effects["pc_rental"].active = true
		G.GAME.all_in_jest.sticker_effects["pc_rental"].num = G.GAME.all_in_jest.sticker_effects["pc_rental"].num + 1

		G.GAME.rental_rate = math.max(G.GAME.rental_rate - self.config.sticker_effects["rental"], 0)

		G.GAME.perishable_rounds = G.GAME.perishable_rounds
				and G.GAME.perishable_rounds + self.config.sticker_effects["perishable"]
			or 5 + self.config.sticker_effects["perishable"]

		G.GAME.all_in_jest.sticker_effects["aij_indecisive"].odds = G.GAME.all_in_jest.sticker_effects["aij_indecisive"].odds
			+ 4

		G.GAME.all_in_jest.sticker_effects["aij_mint_condition"].markup = G.GAME.all_in_jest.sticker_effects["aij_mint_condition"].markup
			- 4

		G.GAME.all_in_jest.sticker_effects["aij_demanding"].hands = { "Pair" }

		for _, card in pairs(G.jokers.cards) do
			if card.ability.perishable then
				cardv.ability.perish_tally = card.ability.perish_tally
						and card.ability.perish_tally + self.config.sticker_effects["perishable"]
					or 5 + self.config.sticker_effects["perishable"]
			end

			-- For updating mint condition
			card:set_cost()
		end

		-- For updating mint condition
		for _, card in pairs(G.shop_jokers.cards) do
			card:set_cost()
		end
	end,
}
return { name = "Vouchers", items = { polkadot } }
