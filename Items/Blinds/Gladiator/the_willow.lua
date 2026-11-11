local the_willow = {
	object_type = "Blind",
	key = "the_willow_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "draw_cards", "suit", "spades" },
	boss_colour = HEX("6f9282"),
	atlas = "blinds",
	pos = { X = 0, y = 3 },
	order = 7,
	dollars = 5,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.stay_flipped and context.to_area == G.hand and context.other_card:is_suit("Spades") then
			return { modify = { to_area = G.discard } }
		end
	end,
}
return { name = { "Blinds" }, items = { the_willow } }
