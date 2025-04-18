SMODS.Consumable {
	key = 'triton',
	loc_txt = {
		name = 'Triton',
		text = {
			"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}Straight Flush{}",
                    "{C:mult}+8{} Mult",
			}
	},
	set = 'Planet',
	set_card_type_badge = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_moon'), G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
	end,
	pos = { x = 1, y = 1 },
	cost = 3,
	unlocked = true,
	discovered = true,
	config = {hand_type = "Straight Flush", moon = true},
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, center)
		return {
			vars = {
				G.GAME.hands['Straight Flush'].level,
				colours = {(G.GAME.hands['Straight Flush'].level==1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands['Straight Flush'].level)])}
			},
		}
    end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local hand = 'Straight Flush'
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(hand, "poker_hands"),
			chips = G.GAME.hands[hand].chips,
			mult = G.GAME.hands[hand].mult,
			level = G.GAME.hands[hand].level,
		})
		G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + 1)
		G.GAME.hands[hand].mult = G.GAME.hands[hand].mult + 8
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        update_hand_text({delay = 0}, {mult = G.GAME.hands[hand].mult, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = nil
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
        delay(1.6)
		update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
		
	end,
}