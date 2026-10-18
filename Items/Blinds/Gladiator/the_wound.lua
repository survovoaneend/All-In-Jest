local the_wound = {
	object_type = "Blind",
	key = "the_wound_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "discard" },
	boss_colour = HEX("e1614c"),
	atlas = "blinds",
	pos = { X = 0, y = 7 },
	order = 42,
	dollars = 5,
	config = { extra = { discarded = false } },

	calculate = function(self, blind, context)
		if context.pre_discard then
			G.GAME.blind.ability.extra.discarded = true
		end
		if context.after then
			G.GAME.blind.ability.extra.discarded = false
		end
	end,
	debuff_hand = function(self, cards, hand, handname, check)
		if not G.GAME.blind.ability.extra.discarded then
			G.GAME.blind.triggered = true
			return true
		end
	end,
}
return { name = { "Blinds" }, items = { the_wound } }
