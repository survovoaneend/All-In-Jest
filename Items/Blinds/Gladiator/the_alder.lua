local the_alder = {
	object_type = "Blind",
	key = "the_alder_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "draw_cards", "suit", "hearts" },
	boss_colour = HEX("af6457"),
	atlas = "blinds",
	pos = { X = 0, y = 2 },
	order = 9,
	dollars = 5,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.stay_flipped and context.to_area == G.hand and context.other_card:is_suit("Hearts") then
			return { modify = { to_area = G.discard } }
		end
	end,
}
return { name = { "Blinds" }, items = { the_alder } }
