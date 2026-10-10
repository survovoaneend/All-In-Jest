local the_branch = {
	object_type = "Blind",
	key = "the_branch_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "draw_cards", "face" },
	boss_colour = HEX("88715a"),
	atlas = "blinds",
	pos = { X = 0, y = 4 },
	order = 15,
	dollars = 5,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.stay_flipped and context.to_area == G.hand and context.other_card:is_face() then
			return { modify = { to_area = G.discard } }
		end
	end,
}
return { name = { "Blinds" }, items = { the_branch } }
