local face = {
	object_type = "Sticker",
	key = "face",
	config = { extra = {} },
	atlas = "stickers_atlas",
	order = 10,
	pos = { x = 2, y = 2 },
	badge_colour = HEX("dbaab5"),
	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,
	sets = { Joker = true },
	rate = 0,
	aij_calc_debuff = true,
	should_apply = function(self, card, center, area, bypass_roll)
		return bypass_roll or card.ability.aij_suit_sticker_choice == 'aij_face'
	end,
	calculate = function(self, card, context)
		if context.before and not card.ability.debuff_sources["aij_face_sticker"] then
			for k, v in pairs(context.full_hand) do
				if v:is_face() then
					SMODS.debuff_card(card, true, "aij_face_sticker", not card.debuff)
					return { message = localize("k_disabled_ex") }
				end
			end
		end
		if context.setting_blind and not card.getting_sliced and card.ability.debuff_sources["aij_face_sticker"] then
			G.E_MANAGER:add_event(Event({
				func = function()
					SMODS.debuff_card(card, nil, "aij_face_sticker")
					card:juice_up()
					return true
				end,
			}))
		end
	end,
}
return { name = { "Stickers" }, items = { face } }
