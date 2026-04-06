local nd15_planet = {
    object_type = "Consumable",
	key = '2013_nd15',
	set = 'Planet',
	set_card_type_badge = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_asteroid'), G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
	end,
	pos = { x = 1, y = 2 },
	cost = 3,
	config = {hand_type = "Three of a Kind", moon = true, chips = true},
	unlocked = true,
	discovered = false,
	order = 13,
	jest_spec_moon = true,
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				G.GAME.hands[card.ability.consumeable.hand_type].level,
				localize(card.ability.consumeable.hand_type, 'poker_hands'),
				G.GAME.hands[card.ability.consumeable.hand_type].l_chips * 2,
				colours = {(G.GAME.hands[card.ability.consumeable.hand_type].level==1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.consumeable.hand_type].level)])}
			},
		}
    end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
        level_up_hand_chips(card, card.ability.consumeable.hand_type)
	end,
}
return {name = {"Planets"}, items = {nd15_planet}}