local planet_nine_planet = {
    object_type = "Consumable",
	key = 'planet_nine',
	set = 'Planet',
	set_card_type_badge = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_moon_q'), G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
	end,
	pos = { x = 3, y = 1 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 9,
	jest_spec_moon = true,
	config = { hand_type = "Five of a Kind", softlock = true, moon = true, mult = true},
	hand_type = 'Five of a Kind', -- Why is this here
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				G.GAME.hands[card.ability.consumeable.hand_type].level,
				localize(card.ability.consumeable.hand_type, 'poker_hands'),
				G.GAME.hands[card.ability.consumeable.hand_type].l_mult * 2,
				colours = {(G.GAME.hands[card.ability.consumeable.hand_type].level==1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.consumeable.hand_type].level)])}
			},
		}
    end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
        level_up_hand_mult(card, card.ability.consumeable.hand_type)
	end,
}
return {name = {"Planets"}, items = {planet_nine_planet}}