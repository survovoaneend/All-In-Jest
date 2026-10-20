local check_for_valid_contexts = function(context)
	if context.change_rank or context.repetition_only then
		return false
	else
		return true
	end
end

local dyscalcular = {
	object_type = "Enhancement",
	key = "dyscalcular",
	atlas = "enhancements_atlas",
	order = 1,
	pos = { x = 1, y = 0 },
	config = {},
	all_in_jest = {
		multi_enhancement_z_order = 1,
	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Other", key = "m_aij_dyscalcular_numbered_rank" }
	end,
	calculate = function(self, card, context)
		if
			context.post_trigger
			and (context.other_context.other_card == card or context.other_context.destroying_card == card)
			and check_for_valid_contexts(context.other_context)
			and not context.blueprint_card
		then
			local triggered_card = context.other_card
			triggered_card.aij_dyscalcular_triggered = triggered_card.aij_dyscalcular_triggered or {}
			triggered_card.aij_dyscalcular_triggered[card.unique_val] = true
			G.E_MANAGER:add_event(Event({
				func = function()
					triggered_card.aij_dyscalcular_triggered[card.unique_val] = false
					return true
				end,
			}))
		end
	end,
}

local aij_eval_card_ref = eval_card
function eval_card(card, context)
	if card.aij_dyscalcular_triggered then
		if
			context.other_card
			and check_for_valid_contexts(context)
			and card.aij_dyscalcular_triggered[context.other_card.unique_val]
		then
			sendDebugMessage("dyscalcular blocked", "AIJ")
			return {}, {}
		end
		if
			context.destroying_card
			and check_for_valid_contexts(context)
			and card.aij_dyscalcular_triggered[context.destroying_card.unique_val]
		then
			sendDebugMessage("dyscalcular blocked", "AIJ")
			return {}, {}
		end
	end
	return aij_eval_card_ref(card, context)
end

local aij_card_get_id_ref = Card.get_id
function Card:get_id()
	if SMODS.has_enhancement(self, "m_aij_dyscalcular") and self.aij_dyscalcular_id_override then
		return self.aij_dyscalcular_id_override
	else
		return aij_card_get_id_ref(self)
	end
end

return { name = { "Enhancements" }, items = { dyscalcular } }
