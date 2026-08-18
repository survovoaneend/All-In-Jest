local eval_card_ref = eval_card
function eval_card(card, context)
    if card.ability.aij_undecisive and context.cardarea == G.jokers and card.config.center.set == 'Joker' then
		local effects = { eval_card_ref(card, context) }
		if next(effects[1]) and not card.ability.aij_undecisive.extra.calulating then
			if SMODS.pseudorandom_probability(card, 'aij_undecisive', 1, 4) then
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.PURPLE})
				return {}, {}
			end
		end
    end
    return eval_card_ref(card, context)
end
local score_card_ref = SMODS.score_card
function SMODS.score_card(card, context)
    if card.ability.aij_undecisive and context.cardarea == G.jokers and card.config.center.set == 'Joker' then
		card.ability.aij_undecisive.extra.calulating = true
		local effects = { eval_card(card, context) }
		card.ability.aij_undecisive.extra.calulating = nil
		if next(effects[1]) then
			if SMODS.pseudorandom_probability(card, 'aij_undecisive', 1, 4) then
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.PURPLE})
				return
			end
		end
    end
    return score_card_ref(card, context)
end
local undecisive = {
    object_type = "Sticker",
    key = "undecisive",
	config = { extra = {  } },
	atlas = "stickers_atlas",
	order = 1,
	pos = {x = 0, y = 2},
	badge_colour = HEX('55a383'),
	ignore = true,
	loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, 4)
		return { 
			vars = {
				numerator, denominator,
			}
		}
	end,
	sets = { Joker = true },
	should_apply = function(self, card, center, area, bypass_reroll)
		if card:has_attribute('passive') then return false end
		return SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
	end,
}
return {name = {"Stickers"}, items = {undecisive}}