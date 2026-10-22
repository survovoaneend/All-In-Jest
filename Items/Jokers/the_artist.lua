local valid_consumable = function(card)
	return card.config.center.set == "Tarot"
		or (
			#SMODS.find_card("j_aij_dark_magician") > 0
			and (card.config.center.set == "Planet" or card.config.center.set == "Spectral")
		)
end

local area_keys_to_check = { "consumeables", "shop_jokers", "pack_cards" }

local the_artist = {
	object_type = "Joker",
	order = 222,

	key = "the_artist",
	config = {
		extra = {
			more_selection = 1,
		},
	},
	attributes = { "passive", "tarot", "select_limit" },
	rarity = 3,
	lite = true,
	pos = { x = 5, y = 8 },
	atlas = "joker_atlas",
	cost = 8,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.more_selection,
				index = "0",
			},
		}
	end,

	update = function(self, card, dt)
		if #SMODS.find_card("j_aij_the_artist") > 0 then
			for _, key in ipairs(area_keys_to_check) do
				if G[key] and G[key].cards then
					for i, consumeable_card in ipairs(G[key].cards) do
						if consumeable_card and valid_consumable(consumeable_card) then
							local index = 0
							for j = 1, #SMODS.find_card("j_aij_the_artist") do
								if SMODS.find_card("j_aij_the_artist")[j] == card then
									index = j
								end
							end

							if
								not consumeable_card.ability.jest_the_artist_applied
								or (
									consumeable_card.ability.jest_the_artist_applied
									and not consumeable_card.ability.jest_the_artist_applied[index]
								)
							then
								consumeable_card.ability.jest_the_artist_applied = consumeable_card.ability.jest_the_artist_applied
									or {}
								consumeable_card.ability.jest_the_artist_applied[index] =
									card.ability.extra.more_selection
								card.ability.extra.index = tostring(index)
								if consumeable_card.ability.max_highlighted then
									consumeable_card.ability.consumeable =
										copy_table(consumeable_card.ability.consumeable)
									jest_ability_calculate(
										consumeable_card,
										"+",
										card.ability.extra.more_selection,
										nil,
										nil,
										true,
										false,
										"ability.consumeable"
									)
									consumeable_card.ability.max_highlighted = consumeable_card.ability.max_highlighted
										+ card.ability.extra.more_selection
								end
							end
						end
					end
				end
			end
		end
	end,

	remove_from_deck = function(self, card, from_debuff)
		for _, key in ipairs(area_keys_to_check) do
			if G[key] and G[key].cards then
				for i, consumeable_card in ipairs(G[key].cards) do
					if consumeable_card and valid_consumable(consumeable_card) then
						if
							consumeable_card.ability
							and consumeable_card.ability.jest_the_artist_applied
							and consumeable_card.ability.consumeable.max_highlighted
						then
							for k, v in pairs(consumeable_card.ability.jest_the_artist_applied) do
								if k == tonumber(card.ability.extra.index) then
									if v then
										jest_ability_calculate(
											consumeable_card,
											"-",
											v,
											nil,
											nil,
											true,
											false,
											"ability.consumeable"
										)
									end
								end
							end
							consumeable_card.ability.max_highlighted = consumeable_card.ability.max_highlighted
								- card.ability.extra.more_selection
						end
					end
				end
			end
		end
	end,
}
return { name = { "Jokers" }, items = { the_artist } }
