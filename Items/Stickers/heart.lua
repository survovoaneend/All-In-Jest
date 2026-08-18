local heart = {
    object_type = "Sticker",
    key = "heart",
	config = { extra = { should_debuff = 2 } },
	atlas = "stickers_atlas",
	order = 7,
	pos = {x = 0, y = 1},
	badge_colour = HEX('f3517b'),
	ignore = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {}}
	end,
	sets = { Joker = true },
	aij_club_compat = false,
	aij_spade_compat = false,
	aij_diamond_compat = false,
	calculate = function(self, card, context)
		if context.before and context.full_hand then
			for k, v in pairs(context.full_hand) do
				if v:is_suit('Hearts') then card.ability.aij_heart.extra.should_debuff = 1 end
			end
			if card.ability.aij_heart and card.ability.aij_heart.extra.should_debuff == 1 then
				card.ability.aij_heart.extra.should_debuff = 0
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_disabled_ex'),colour = G.C.FILTER, delay = 0.45})
				card:set_debuff()
			end
		end
    end
}
return {name = {"Stickers"}, items = {heart}}