local the_ancestor = {
	object_type = "Blind",
	key = "the_ancestor_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "hand_type", "discard" },
	boss_colour = HEX("f03464"),
	atlas = "blinds",
	pos = { X = 0, y = 45 },
	order = 43,
	dollars = 5,
	lite = true,
	debuff_hand = function(self, cards, hand, handname, check)
		if G.GAME.all_in_jest.discarded_poker_hands_ante[handname] then
			G.GAME.blind.triggered = true
			return true
		end
	end,
}
return { name = { "Blinds" }, items = { the_ancestor } }
