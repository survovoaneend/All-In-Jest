SMODS.PokerHand:take_ownership("High Card", {
	modify_display_text = function(self, cards, scoring_hand)
		if #cards == 0 then
			return "aij_Nothing_q"
		end
	end,
}, true)
