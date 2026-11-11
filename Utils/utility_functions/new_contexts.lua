-- Blacklist new contexts from being retriggered
SMODS.CONTEXT_RETRIGGER_BLACKLIST["aij_retriggered_card"] = true

-- Add cashing_out context
local cash_out_ref = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
	SMODS.calculate_context({
		cashing_out = true,
	})

	cash_out_ref(e)
end

-- For Bizco, taken from paperback
local calculate_main_scoring_ref = SMODS.calculate_main_scoring
function SMODS.calculate_main_scoring(context, scoring_hand)
	calculate_main_scoring_ref(context, scoring_hand)
	if context.cardarea == G.play or context.cardarea == "unscored" then
		SMODS.calculate_context({
			all_in_jest = {
				after_scoring_cards = true,
			},
			full_hand = G.play.cards,
			scoring_hand = context.scoring_hand,
			scoring_name = context.scoring_name,
			poker_hands = context.poker_hands,
		})
	end
end

-- Add context for when an edition is triggered
-- (As of v0.6 is just for Chromasist)
local aij_card_calculate_edition_ref = Card.calculate_edition
function Card:calculate_edition(context)
	local ret = aij_card_calculate_edition_ref(self, context)

	if ret then
		SMODS.calculate_context({
			all_in_jest = { calculating_edition = true, other_card = self, edition = self.edition, area = self.area },
		})
	end

	return ret
end

-- Workshoping
-- context.chance_trigger.trigger (returns true when 1 in whatever chance is true and false when it fails)
-- context.chance_trigger.chances (The denomator of the triggered chance)
