local the_celebration = {
	object_type = "Blind",
	key = "the_celebration_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "large_blind", "hands", "discard" },
	boss_colour = HEX("ff6368"),
	atlas = "blinds",
	pos = { X = 0, y = 33 },
	order = 27,
	dollars = 5,

	aij_blind_amount_display = function(self, blind, base_blind_amount, mult)
		local unused = G.GAME.all_in_jest.unused_hands.run
		return base_blind_amount * (mult + unused * 0.25)
	end,

	set_blind = function(self)
		local unused = G.GAME.all_in_jest.unused_hands.run
		All_in_Jest.ease_blind_requirement(unused * 0.25, 0)
	end,

	disable = function()
		G.GAME.blind.chips = G.GAME.blind.aij_original_chips
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,

	defeat = function(self)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
	end,
}
return { name = { "Blinds" }, items = { the_celebration } }
