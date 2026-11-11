local melded = {
	object_loader = CardSleeves,
	object_type = "Sleeve",
	order = 5,
	key = "melded",
	atlas = "sleeve_atlas",
	pos = { x = 4, y = 0 },
	unlocked = false,
	unlock_condition = { deck = "b_aij_melded", stake = "stake_blue" },
	loc_vars = function(self)
		local key
		local vars = {}
		if self.get_current_deck_key() == "b_aij_melded" then
			key = self.key .. "_alt"
			vars = { localize({ type = "name_text", key = "c_aij_palmistry", set = "Spectral" }) }
		else
			key = self.key
		end
		return { key = key, vars = vars }
	end,
	apply = function(self, sleeve)
		CardSleeves.Sleeve.apply(self)
		if self.get_current_deck_key() == "b_aij_melded" then
			G.E_MANAGER:add_event(Event({
				func = function()
					local card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, "c_aij_palmistry", "deck")
					card:add_to_deck()
					G.consumeables:emplace(card)
					return true
				end,
			}))
		else
			G.GAME.all_in_jest.fusion_enhancements = true
		end
	end,
}
if next(SMODS.find_mod("CardSleeves")) then
	return { name = { "Sleeves" }, items = { melded } }
end
