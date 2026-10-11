local the_gift = {
	object_type = "Blind",
	key = "the_gift_GL",
	boss = {
		min = 6,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "lose_economy", "economy" },
	boss_colour = HEX("c75d5d"),
	atlas = "blinds",
	pos = { x = 0, y = 44 },
	order = 40,
	dollars = 5,

	set_blind = function(self)
		local diff = 10 - G.GAME.dollars
		G.GAME.current_round.aij_the_gift_GL = { diff = diff }
		if diff ~= 0 then
			ease_dollars(diff, true)
		end
		G.GAME.blind.triggered = true
	end,
	disable = function(self)
		local data = G.GAME.current_round.aij_the_gift_GL
		if data and data.diff ~= 0 then
			ease_dollars(-data.diff, true)
		end
		G.GAME.current_round.aij_the_gift_GL = nil
	end,
	defeat = function(self)
		G.GAME.current_round.aij_the_gift_GL = nil
	end,
}
return { name = { "Blinds" }, items = { the_gift } }