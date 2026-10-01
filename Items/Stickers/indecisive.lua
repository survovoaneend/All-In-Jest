local eval_card_ref = eval_card
function eval_card(card, context)
	local effects = { eval_card_ref(card, context) }
	if card.ability.aij_indecisive and effects[1].jokers then
		if
			effects[1].jokers.repetitions
			and SMODS.pseudorandom_probability(card, "aij_indecisive_" .. card.config.center.key, 1, 4)
		then
			effects[1] = {}
			effects[2] = {}
			card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_nope_ex"), colour = G.C.GREEN })
		else
			for _, key in ipairs(SMODS.scoring_parameter_keys) do
				if effects[1].jokers[key] then
					if SMODS.pseudorandom_probability(card, "aij_indecisive", 1, 4) then
						effects[1].jokers = {
							card = card,
							message = localize("k_nope_ex"),
							colour = G.C.GREEN,
							message_card = context.other_card or card,
						}
						effects[2] = {}
					end
					break
				end
			end
		end
	end
	return unpack(effects)
end
local indecisive = {
	object_type = "Sticker",
	key = "indecisive",
	config = { extra = {} },
	atlas = "stickers_atlas",
	order = 1,
	pos = { x = 0, y = 2 },
	badge_colour = HEX("55a383"),
	rate = 0.3,
	loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, 4)
		return {
			vars = {
				numerator,
				denominator,
			},
		}
	end,
	sets = { Joker = true },
	should_apply = function(self, card, center, area, bypass_roll)
		if
			SMODS.has_attribute(center, "retrigger")
			or SMODS.has_attribute(center, "mult")
			or SMODS.has_attribute(center, "chips")
			or SMODS.has_attribute(center, "xmult")
			or SMODS.has_attribute(center, "xchips")
		then
			return SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
		end
		return false
	end,
}
return { name = { "Stickers" }, items = { indecisive } }
