local the_wall = {
	object_type = "Blind",
	key = "violet_vessel_GL",
	boss = {
		showdown = true,
        all_in_jest = {
            gladiator = true
        }
	},
	mult = 10,
	attributes = { "large_blind" },
	boss_colour = HEX("8a71e1"),
	pos = { x = 0, y = 29 },
	order = 53,
	dollars = 8,

    disable = function(self)
        G.GAME.blind.chips = G.GAME.blind.chips / 3
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,
}
return { name = { "Blinds" }, items = { the_wall } }
