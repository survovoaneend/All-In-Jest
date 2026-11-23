local the_ludovico_technique = {
	object_type = "Joker",
	order = 335,

	key = "the_ludovico_technique",
	config = {
		extra = {
			first_hand = nil,
		},
	},
	attributes = { "hand_level", "hand_type", "hands" },
	rarity = 1,
	pos = { x = 24, y = 12 },
	atlas = "joker_atlas",
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.first_hand or localize("k_none"),
			},
		}
	end,

	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			card.ability.extra.first_hand = nil
		end
		if
			(context.before or context.debuffed_hand)
			and not context.blueprint
			and G.GAME.current_round.hands_played == 0
		then
			card.ability.extra.first_hand = context.scoring_name
		end
		if context.before and G.GAME.current_round.hands_left == 0 and card.ability.extra.first_hand then
			return {
				message = localize("k_level_up_ex"),
				func = function()
					level_up_hand(context.blueprint_card or card, card.ability.extra.first_hand)
					return true
				end,
			}
		end
	end,
}
return { name = { "Jokers" }, items = { the_ludovico_technique } }
