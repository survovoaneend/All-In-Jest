local the_birch = {
	object_type = "Blind",
	key = "the_birch_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "xscore", "rank", "two", "four", "six", "eight", "ten" },
	boss_colour = HEX("5b9baa"),
	atlas = "blinds",
	pos = { X = 0, y = 13 },
	order = 32,
	dollars = 5,
	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.all_in_jest and context.all_in_jest.before_after then
			local evens = 0
			for _, card in ipairs(context.full_hand) do
				if not SMODS.has_no_rank(card) then
					local id = card:get_id()
					if id <= 10 and id % 2 == 0 then
						evens = evens + 1
					end
				end
			end
			if evens > 0 then
				G.GAME.aij_score_reduction = G.GAME.aij_score_reduction * math.max(1 - 0.2 * evens, 0)
				blind:wiggle()
				blind.triggered = true
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_birch } }
