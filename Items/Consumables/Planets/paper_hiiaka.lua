local paper_hiiaka_planet = {
    object_type = "Consumable",
	key = 'paper_hiiaka',
	set = 'Planet',
	set_card_type_badge = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_moon'), G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
	end,
	pos = { x = 4, y = 5 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 29,
	jest_rec_paperback = true,
	jest_spec_moon = true,
	config = { hand_type = "paperback_Straight Spectrum", softlock = true, moon = true , chips = true},
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
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(card.ability.consumeable.hand_type, 'poker_hands'),chips = G.GAME.hands[card.ability.consumeable.hand_type].chips, mult = G.GAME.hands[card.ability.consumeable.hand_type].mult, level=G.GAME.hands[card.ability.consumeable.hand_type].level})
        level_up_hand_chips(card, card.ability.consumeable.hand_type)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
	end,
}
if next(SMODS.find_mod("Bunco")) then
	paper_hiiaka_planet.config.hand_type = string.gsub(paper_hiiaka_planet.config.hand_type, "paperback", "bunc")
end
return {name = {"Planets"}, items = {paper_hiiaka_planet}}