local the_spear = {
	object_type = "Blind",
	key = "the_spear_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	boss_colour = HEX("56a786"),
	atlas = "blinds",
	pos = { X = 0, y = 41 },
	order = 47,
	dollars = 5,

	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if context.all_in_jest and context.all_in_jest.before_after and not temp then
			if context.total_chips + G.GAME.chips >= G.GAME.blind.chips then
				for i = 1, #context.scoring_hand do
					G.E_MANAGER:add_event(Event({
						trigger = "before",
						func = function()
							context.scoring_hand[i].ability.all_in_jest = context.scoring_hand[i].ability.all_in_jest
								or {}
							context.scoring_hand[i].ability.all_in_jest.perma_debuff = true
							return true
						end,
					}))
				end
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_spear } }
