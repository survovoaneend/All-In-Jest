local the_head = {
	object_type = "Blind",
	key = "the_head_GL",
	boss = {
		min = 1,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "xscore", "hearts", "suit"},
	boss_colour = HEX("ac9db4"),
	pos = { x = 0, y = 21 },
	order = 16,
	dollars = 5,
	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if context.all_in_jest and context.all_in_jest.before_round_end_check and not temp then
			local hearts = 0
			for _, card in ipairs(context.full_hand) do
				if card:is_suit("Hearts") then
					hearts = hearts + 1
				end
			end
			if hearts > 0 then
				local reduction = math.min(0.20 * hearts, 1) -- so ice cards and whatnot don't cause score to go negative, unless we want that
				local minus_amt = math.floor(context.total_chips * reduction)
				ease_chips(context.total_chips - minus_amt)
			end
			blind.triggered = true
		end
	end,
}
return { name = { "Blinds" }, items = { the_head } }
