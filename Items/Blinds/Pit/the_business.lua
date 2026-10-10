local the_business = {
	object_type = "Blind",
	key = "the_business",
	boss = {
		min = 4,
		all_in_jest = {
			pit = true,
		},
	},
	in_pool = function(self)
		return All_in_Jest.pit_blinds_in_play()
	end,
	mult = 2,
	attributes = { "destroy_card", "joker", "generation", "rarity", "stickers" },
	boss_colour = HEX("3e4b4d"),
	atlas = "blinds_pit",
	pos = { y = 21 },
	order = 522,
	dollars = 6,
	config = {},

	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if context.end_of_round and context.main_eval and not temp then
			local destroyable_jokers = {}
			for i = 1, #G.jokers.cards do
				if not SMODS.is_eternal(G.jokers.cards[i]) then
					table.insert(destroyable_jokers, G.jokers.cards[i])
				end
			end
			if #destroyable_jokers > 0 then
				local card_index = pseudorandom("jest_the_business", 1, 2)
				if card_index == 2 then
					SMODS.destroy_cards(destroyable_jokers[#destroyable_jokers])
				else
					SMODS.destroy_cards(destroyable_jokers[1])
				end

				local eternal_compat_common_pool = SMODS.create_poll_pool({ "Joker" }, {
					type = "Joker",
					types = { "Joker" },
					guarenteed = true,
					rarity = 1,
					rarities = { "Common" },
					append = "aij_the_business",
				})
				for i, center in ipairs(eternal_compat_common_pool) do
					if not G.P_CENTERS[center.key].eternal_compat then
						eternal_compat_common_pool[i].key = "UNAVAILABLE"
					end
				end

				local forced_key = SMODS.poll_object({
					type = "Joker",
					guaranteed = true,
					pool = eternal_compat_common_pool,
					append = "aij_the_bussiness",
				})
				local card = SMODS.create_card({
					set = "Joker",
					key = forced_key,
					area = G.jokers,
					no_edition = true,
					rarity = 0,
					key_append = "aij_the_bussiness",
					force_stickers = { "eternal" },
				})
				card:add_to_deck()
				G.jokers:emplace(card)
				card:start_materialize()
				blind.triggered = true
				blind:wiggle()
			end
		end
	end,
}
return { name = { "Pit Blinds" }, items = { the_business } }
