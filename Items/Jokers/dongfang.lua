local dongfang = {
	object_type = "Joker",
	order = 1032,

	key = "dongfang",
	config = {
		extra = {
			triggers = 2,
		},
	},
	attributes = { "retrigger", "planet", "consumable" },
	rarity = 4,
	unlock_condition = { hidden = true },
	pos = { x = 1, y = 6 },
	atlas = "legendary_atlas",
	cost = 20,
	unlocked = false,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	soul_pos = { x = 1, y = 7 },

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.total_triggers } }
	end,

	calculate = function(self, card, context)
		if context.using_consumeable and not context.aij_retriggered_consumable then
			if context.consumeable.ability.set == "Planet" then
				-- Check if the consumable can be used
				-- Would be true for planets usually, but for Dark Magician compat other consumables might not pass this check
				local retriggered = false
				for i = 1, card.ability.extra.triggers do
					if
						type(context.consumeable.can_use_consumeable) == "function"
						and context.consumeable:can_use_consumeable(true, true)
					then
						retriggered = true
						-- Doing calculate "early" to maintain intuitive order of animations
						SMODS.calculate_context({
							using_consumeable = true,
							consumeable = context.consumeable,
							area = context.from_area,
							aij_retriggered_consumable = true,
						})
						card_eval_status_text(
							context.blueprint_card or card,
							"extra",
							nil,
							nil,
							nil,
							{ message = localize("k_again_ex"), colour = G.C.FILTER }
						)
						context.consumeable:use_consumeable(context.area)
					else
						break
					end
				end
				if retriggered then
					return nil, true
				end
			end
		end
	end,
}
return { name = { "Jokers" }, items = { dongfang } }
