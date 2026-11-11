local the_dagger = {
	object_type = "Blind",
	key = "the_dagger_GL",

	boss = {
		min = 1,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "suit", "hearts", "diamonds" },
	boss_colour = HEX("692a2a"),
	atlas = "blinds",
	pos = { X = 0, y = 90 },
	order = 5,
	dollars = 5,

	calculate = function(self, blind, context) end,
	debuff_hand = function(self, cards, hand, handname, check)
		if cards then
			for k, v in ipairs(cards) do
				if v:is_suit("Hearts") or v:is_suit("Diamonds") then
					G.GAME.blind.triggered = true
					return true
				end
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_dagger } }
