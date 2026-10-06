local the_ulcer = {
	object_type = "Blind",
	key = "the_ulcer_GL",

	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "hands", "discard" },
	boss_colour = HEX("e39571"),
	atlas = "blinds",
	pos = { X = 0, y = 10 },
	order = 33,
	dollars = 5,
	lite = true,

	calculate = function(self, blind, context) end,

	set_blind = function(self)
		ease_hands_played(-2)
		ease_discard(-2)
	end,

	disable = function(self)
		ease_hands_played(2)
		ease_discard(2)
	end,

	defeat = function(self)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if not temp then
			ease_hands_played(2)
			ease_discard(2)
		end
	end,
}
return { name = { "Blinds" }, items = { the_ulcer } }
