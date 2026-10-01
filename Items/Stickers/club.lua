local club = {
	object_type = "Sticker",
	key = "club",
	config = { extra = { should_debuff = 2 } },
	atlas = "stickers_atlas",
	order = 8,
	pos = { x = 1, y = 1 },
	badge_colour = HEX("417c78"),
	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,
	sets = { Joker = true },
	aij_heart_compat = false,
	aij_spade_compat = false,
	aij_diamond_compat = false,
	rate = 0.06, -- 1/5th of standard since there's 5 stickers in this set
	aij_calc_debuff = true,
	calculate = function(self, card, context)
		if context.before and not card.ability.debuff_sources["aij_club_sticker"] then
			for k, v in pairs(context.full_hand) do
				if v:is_suit("Clubs") then
					SMODS.debuff_card(card, true, "aij_club_sticker", not card.debuff)
					return { message = localize("k_disabled_ex") }
				end
			end
		end
		if context.setting_blind and not card.getting_sliced and card.ability.debuff_sources["aij_club_sticker"] then
			G.E_MANAGER:add_event(Event({
				func = function()
					SMODS.debuff_card(card, nil, "aij_club_sticker")
					card:juice_up()
					return true
				end,
			}))
		end
	end,
}
return { name = { "Stickers" }, items = { club } }
