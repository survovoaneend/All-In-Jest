local heart = {
	object_type = "Sticker",
	key = "heart",
	config = { extra = { should_debuff = 2 } },
	atlas = "stickers_atlas",
	order = 7,
	pos = { x = 0, y = 1 },
	badge_colour = HEX("f3517b"),
	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,
	sets = { Joker = true },
	aij_club_compat = false,
	aij_spade_compat = false,
	aij_diamond_compat = false,
	rate = 0.06, -- 1/5th of standard since there's 5 stickers in this set
	aij_calc_debuff = true,
	calculate = function(self, card, context)
		if context.before and context.full_hand then
			for k, v in pairs(context.full_hand) do
				if v:is_suit("Hearts") then
					SMODS.debuff_card(card, true, "aij_heart_sticker", true)
					return { message = localize("k_disabled_ex") }
				end
			end
		end
		if context.setting_blind and not card.getting_sliced and card.ability.debuff_sources["aij_heart_sticker"] then
			G.E_MANAGER:add_event(Event({
				func = function()
					SMODS.debuff_card(card, nil, "aij_heart_sticker")
					card:juice_up()
					return true
				end,
			}))
		end
	end,
}
return { name = { "Stickers" }, items = { heart } }
