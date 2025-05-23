local gravastar_spectral = {
    object_type = "Consumable",
	key = 'gravastar',
	set = 'Spectral',
	pos = { x = 3, y = 4 },
	cost = 4,
    hidden = true,
    soul_rate = 0.003,
    soul_set = 'Planet',
	unlocked = true,
	discovered = false,
    order = 3,
	config = {moon = true},
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
	end,
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area, copier)
        -- Display initial UI update for "All Hands"
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {
            handname = localize('k_all_hands'),
            chips = '...',
            mult = '...', -- Explicitly show no mult change
            level= ''
        })
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        -- Explicitly show no mult change
        update_hand_text({delay = 0}, {chips = '+', StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = nil
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+1'})

        -- Apply the actual stat changes silently
        for hand_key, hand_data in pairs(G.GAME.hands) do
            level_up_hand_chips(card, hand_key, true)
        end
        delay(1.6)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end,
}
return {name = {"Spectrals", "Planets"}, items = {gravastar_spectral}}