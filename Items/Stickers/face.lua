local face = {
    object_type = "Sticker",
    key = "face",
	config = { extra = { should_debuff = 2 } },
	atlas = "stickers_atlas",
	order = 9,
	pos = {x = 2, y = 2},
	badge_colour = HEX('dbaab5'),
	ignore = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {}}
	end,
	sets = { Joker = true },
	should_apply = function(self, card, center, area, bypass_reroll)
		if card:has_attribute('face') then return false end
		return SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
	end,
	calculate = function(self, card, context)
		if context.before and context.full_hand then
			for k, v in pairs(context.full_hand) do
				if v:is_face() then card.ability.aij_face.extra.should_debuff = 1 end
			end
			if card.ability.aij_face and card.ability.aij_face.extra.should_debuff == 1 then
				card.ability.aij_face.extra.should_debuff = 0
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_disabled_ex'),colour = G.C.FILTER, delay = 0.45})
				card:set_debuff()
			end
		end
    end
}
return {name = {"Stickers"}, items = {face}}