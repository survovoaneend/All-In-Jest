local the_storm = {
	object_type = "Blind",
	key = "the_storm_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "destroy_card" },
	boss_colour = HEX("b48b52"),
	atlas = "blinds",
	pos = { x = 0, y = 37 },
	order = 45,
	dollars = 5,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.after and context.scoring_hand then
			local to_destroy = {}
			for _, card in ipairs(context.scoring_hand) do
				if not card.debuff then
					to_destroy[#to_destroy + 1] = card
				end
			end
			if #to_destroy > 0 then
				blind.triggered = true
				blind:wiggle()
				SMODS.destroy_cards(to_destroy)
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_storm } }
