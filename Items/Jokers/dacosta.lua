local dacosta = {
	object_type = "Joker",
	order = 1015,

	key = "dacosta",
	config = {},
	attributes = { "copying" },
	rarity = 4,
	unlock_condition = { hidden = true },
	pos = { x = 4, y = 2 },
	atlas = "legendary_atlas",
	cost = 20,
	unlocked = false,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
    perishable_compat = true,
	soul_pos = { x = 4, y = 3 },

	loc_vars = function(self, info_queue, card) end,

	calculate = function(self, card, context)
		if card.is_doodle_calculating then
			return
		end
		card.is_doodle_calculating = true

		local my_index = nil
		for i, joker_in_area in ipairs(G.jokers.cards) do
			if joker_in_area == card then
				my_index = i
				break
			end
		end

		if not my_index or #G.jokers.cards <= 1 then
			card.is_doodle_calculating = false
			return
		end

		local target_joker1 = nil
		local target_joker2 = nil
		local num_jokers = #G.jokers.cards

		if my_index then
			if my_index > 1 then
				target_joker1 = G.jokers.cards[my_index - 1]
			end
			if my_index < num_jokers then
				target_joker2 = G.jokers.cards[my_index + 1]
			end
		end
		if target_joker1 == card then
			target_joker1 = nil
		end
		if target_joker2 == card then
			target_joker2 = nil
		end

		local effect_to_return = nil

        local effect1_def
        if target_joker1 then
            effect1_def = SMODS.blueprint_effect(card, target_joker1, context)
        end

        local effect2_def
        if target_joker2 then
            effect2_def = SMODS.blueprint_effect(card, target_joker2, context)
        end

        if effect1_def and effect2_def then
            effect_to_return = SMODS.merge_effects({ effect1_def, effect2_def })
        else
            effect_to_return = effect1_def or effect2_def
        end

		card.is_doodle_calculating = false

        return effect_to_return
	end,
}
return { name = { "Jokers" }, items = { dacosta } }
