local the_wall = {
	object_type = "Blind",
	key = "the_wall_GL",
	boss = {
		min = 2,
        all_in_jest = {
            gladiator = true
        }
	},
	mult = 6,
	attributes = { "large_blind" },
	boss_colour = HEX("8a59a5"),
	pos = { x = 0, y = 9 },
	order = 17,
	dollars = 5,

    disable = function(self)
        G.GAME.blind.chips = G.GAME.blind.chips / 3
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,
}
return { name = { "Blinds" }, items = { the_wall } }
