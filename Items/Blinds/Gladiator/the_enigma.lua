local the_enigma = {
	object_type = "Blind",
	key = "the_enigma_GL",
	boss = {
		min = 4,
		all_in_jest = {
			gladiator = true,
		},
	},
	in_pool = function(self)
		if G.playing_cards then
			local count = 0
			for k, v in ipairs(G.playing_cards) do
				if next(SMODS.get_enhancements(v)) then
					count = count + 1
				end
			end
			return count >= 4
		end
	end,
	mult = 1,
	attributes = { "enhancements", "draw_cards" },
	boss_colour = HEX("6b4d74"),
	atlas = "blinds",
	pos = { X = 0, y = 26 },
	order = 34,
	dollars = 5,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.stay_flipped and context.to_area == G.hand and next(SMODS.get_enhancements(context.other_card)) then
			return { modify = { to_area = G.discard } }
		end
	end,
}
return { name = { "Blinds" }, items = { the_enigma } }
