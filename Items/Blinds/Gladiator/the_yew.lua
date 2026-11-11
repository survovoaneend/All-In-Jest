local the_yew = {
	object_type = "Blind",
	key = "the_yew_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "xscore", "rank", "ace", "three", "five", "seven", "nine" },
	boss_colour = HEX("f28a3c"),
	atlas = "blinds",
	pos = { X = 0, y = 12 },
	order = 31,
	dollars = 5,
	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.all_in_jest and context.all_in_jest.before_after then
			local odds = 0
			for _, card in ipairs(context.full_hand) do
				if not SMODS.has_no_rank(card) then
					local id = card:get_id()
					if id == 14 or (id <= 10 and id % 2 == 1) then
						odds = odds + 1
					end
				end
			end
			if odds > 0 then
				G.GAME.aij_score_reduction = G.GAME.aij_score_reduction * math.max(1 - 0.2 * odds, 0)
				blind:wiggle()
				blind.triggered = true
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_yew } }
