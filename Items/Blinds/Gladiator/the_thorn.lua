local the_thorn = {
	object_type = "Blind",
	key = "the_thorn_GL",
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
	mult = 2,
	attributes = { "xscore", "enhancements" },
	boss_colour = HEX("56a786"),
	atlas = "blinds",
	pos = { X = 0, y = 29 },
	order = 33,
	dollars = 5,
	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.all_in_jest and context.all_in_jest.before_after then
			if context.all_in_jest and context.all_in_jest.before_after then
				local enhanced = 0
				for _, card in ipairs(context.full_hand) do
					if next(SMODS.get_enhancements(card)) then
						enhanced = enhanced + 1
					end
				end
				if enhanced > 0 then
					G.GAME.aij_score_reduction = G.GAME.aij_score_reduction * math.max(1 - 0.2 * enhanced, 0)
					blind:wiggle()
					blind.triggered = true
				end
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_thorn } }
