SMODS.Consumable {
	key = 'gravastar',
	loc_txt = {
		name = 'Gravastar',
		text = {
			'{C:attention}Levels up{} the',
            '{C:blue}Chips{} of all',
            '{C:legendary,E:1}poker hands'
			}
	},
	set = 'Spectral',
	pos = { x = 3, y = 4 },
	cost = 4,
    hidden = true,
    soul_rate = 0.003,
    soul_set = 'Planet',
	unlocked = true,
	discovered = true,
	config = {moon = true},
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, center)
	end,
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area, copier)


        -- Display initial UI update for "All Hands"
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {
            handname = localize('k_all_hands'),
            chips = '...', -- Explicitly show no chip change
            mult = '...',
            level= ''
        })
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        update_hand_text({delay = 0}, {chips = '+', StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = nil
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+1'})

        -- Apply the actual stat changes silently
        for hand_key, hand_data in pairs(G.GAME.hands) do
                local chips_increase = hand_data.l_chips * 2
                G.GAME.hands[hand_key].chips = G.GAME.hands[hand_key].chips + chips_increase

                G.GAME.hands[hand_key].level = math.max(0, G.GAME.hands[hand_key].level + 1)
        end
        delay(1.6)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end,

    
	
}