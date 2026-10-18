local the_steed = {
	object_type = "Blind",
	key = "the_steed_GL",

	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "debuff" },
	boss_colour = HEX("cfd1d5"),
	atlas = "blinds",
	pos = { X = 0, y = 39 },
	order = 35,
	dollars = 5,

	calculate = function(self, blind, context)
		if context.aij_before_before and not blind.disabled then
			blind.triggered = false
			for i = 1, #G.hand.cards do
				if not G.hand.cards[i].debuffed then
					if not blind.triggered then
						blind.triggered = true
						blind:wiggle()
					end
					SMODS.debuff_card(G.hand.cards[i], true, "the_steed", true)
					G.hand.cards[i]:juice_up()
				end
			end
		end
	end,
	disable = function(self)
		for k, v in pairs(G.playing_cards) do
			SMODS.debuff_card(v, false, "the_steed")
		end
	end,

	defeat = function(self)
		for k, v in pairs(G.playing_cards) do
			SMODS.debuff_card(v, false, "the_steed")
		end
	end,
}
return { name = { "Blinds" }, items = { the_steed } }
