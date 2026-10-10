local the_day = {
	object_type = "Blind",
	key = "the_day_GL",

	boss = {
		min = 1,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "suit", "spades", "clubs" },
	boss_colour = HEX("fda9c0"),
	atlas = "blinds",
	pos = { X = 0, y = 46 },
	order = 4,
	dollars = 5,

	calculate = function(self, blind, context) end,
	debuff_hand = function(self, cards, hand, handname, check)
		if cards then
			for k, v in ipairs(cards) do
				if v:is_suit("Spades") or v:is_suit("Clubs") then
					G.GAME.blind.triggered = true
					return true
				end
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_day } }
