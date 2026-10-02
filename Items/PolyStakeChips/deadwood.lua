local deadwood = {
	object_loader = All_in_Jest,
	object_type = "PolyStakeChip",
	order = 20,
	key = "deadwood",
	pos = { x = 1, y = 2 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 900,
	stack = 2,
	points = { 100, 300 },
	apply = function(self, stack)
		for i = 1, 6 * stack do
			G.playing_card = (G.playing_card and G.playing_card + 1) or 1
			local _s = pseudorandom_element({ "S", "H", "C", "D" }, pseudoseed("deadwood_suit"))
			local _card = Card(
				G.deck.T.x,
				G.deck.T.y,
				G.CARD_W,
				G.CARD_H,
				G.P_CARDS[_s .. "_A"],
				G.P_CENTERS["c_base"],
				{ playing_card = G.playing_card }
			)
			_card.ability.deadwood_blank = true
			_card:set_sprites(nil, _card.config.card)
			_card:add_to_deck()
			G.deck:emplace(_card)
			table.insert(G.playing_cards, _card)
			G.GAME.starting_deck_size = G.GAME.starting_deck_size + 1
		end
	end,
}
return { name = { "PolyStakeChips" }, items = { deadwood } }
