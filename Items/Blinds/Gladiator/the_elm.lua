local the_elm = {
	object_type = "Blind",
	key = "the_elm_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "draw_cards", "suit", "clubs" },
	boss_colour = HEX("5a835e"),
	atlas = "blinds",
	pos = { X = 0, y = 1 },
	order = 11,
	dollars = 5,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.stay_flipped and context.to_area == G.hand and context.other_card:is_suit("Clubs") then
			return { modify = { to_area = G.discard } }
		end
	end,
}
return { name = { "Blinds" }, items = { the_elm } }
