local the_beith = {
	object_type = "Blind",
	key = "the_beith_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "draw_cards", "suit", "diamonds" },
	boss_colour = HEX("ddebe5"),
	atlas = "blinds",
	pos = { X = 0, y = 0 },
	order = 13,
	dollars = 5,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.stay_flipped and context.to_area == G.hand and context.other_card:is_suit("Diamonds") then
			return { modify = { to_area = G.discard } }
		end
	end,
}
return { name = { "Blinds" }, items = { the_beith } }
