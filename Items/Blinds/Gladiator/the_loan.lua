local the_loan = {
	object_type = "Blind",
	key = "the_loan_GL",
	boss = {
		min = 4,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "modify_card", "stickers", "chance" },
	boss_colour = HEX("e8a94f"),
	atlas = "blinds",
	pos = { x = 0, y = 70 },
	order = 50,
	dollars = 5,

	loc_vars = function(self)
		local numerator, denominator = SMODS.get_probability_vars(self, 1, 5, "the_loan_GL")
		return { vars = { numerator, denominator } }
	end,
	collection_loc_vars = function(self)
		return { vars = { "1", "5" } }
	end,

	defeat = function(self)
		local blind = G.GAME.blind
		if not blind or blind.disabled then
			return
		end
		local any = false
		for _, card in ipairs(G.deck.cards) do
			if not card.ability.rental and SMODS.pseudorandom_probability(blind, "the_loan_GL", 1, 5) then
				card:set_rental(true)
				any = true
			end
		end
		if any then
			blind:wiggle()
		end
	end,
}
return { name = { "Blinds" }, items = { the_loan } }
