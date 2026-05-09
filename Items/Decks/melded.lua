local melded = {
	object_type = "Back",
	key = "melded",
	atlas = "deck_atlas",
	order = 4,
	pos = { x = 4, y = 0 },
	unlocked = false,
	unlock_condition = { hidden = true, stake = 5, count = 5 },
	config = {},
	loc_vars = function(self)
		return { vars = {} }
	end,
	locked_loc_vars = function(self)
		local stake_name = localize({
			type = "name_text",
			set = "Stake",
			key = G.P_CENTER_POOLS.Stake[self.unlock_condition.stake].key,
		})
		return { vars = {
			self.unlock_condition.count,
			stake_name,
			colours = { get_stake_col(self.unlock_condition.stake) },
		} }
	end,
	check_for_unlock = function(self, args)
		if args.type == "win_stake" then
			local req_stake_wins = 0
			for _, deck in pairs(G.PROFILES[G.SETTINGS.profile].deck_usage) do
				local deck_won_with = nil
				for k, v in pairs(deck.wins) do
					if k >= 5 then
						req_stake_wins = req_stake_wins + 1
						break
					end
				end
			end
			return req_stake_wins >= 5
		end
	end,
}

local aij_card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
	if
		G.GAME.selected_back
		and G.GAME.selected_back.name == "b_aij_melded"
		and self.ability
		and self.ability.set == "Enhanced"
        and not SMODS.aij_applying_thing
	then
		local old_center = self.config.center
		All_in_Jest.set_other_enhancement(self, old_center.key)
	end

	return aij_card_set_ability_ref(self, center, initial, delay_sprites)
end

return { name = { "Decks" }, items = { melded } }
