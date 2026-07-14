local rising_dead_tarot = {
    object_type = "Consumable",
	key = 'rising_dead',
	set = 'Tarot',
	pos = { x = 14, y = 8 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 18,
	config = { max_highlight = 2 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.max_highlight,
			}
		}
	end,
	can_use = function(self, card)
        if G.hand and (#G.hand.highlighted == card.ability.max_highlight) then
			local conv_card = G.hand.highlighted[1]
			for i=1, #G.hand.highlighted do if G.hand.highlighted[i].T.x < conv_card.T.x then conv_card = G.hand.highlighted[i] end end
			if conv_card.config.center ~= G.P_CENTERS.c_base or conv_card.seal then
				return true
			end
        end
    end,
	use = function(self, card)
		local conv_card = G.hand.highlighted[1]
		for i=1, #G.hand.highlighted do if G.hand.highlighted[i].T.x < conv_card.T.x then conv_card = G.hand.highlighted[i] end end
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, #G.hand.highlighted do
					if G.hand.highlighted[i] ~= conv_card then
						G.hand.highlighted[i]:set_ability(G.P_CENTERS[conv_card.config.center.key], nil, true)
						G.hand.highlighted[i]:set_seal(conv_card.seal, nil, true)
					end
				end
                return true
            end
        }))
		for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        delay(0.5)
	end,
}
return {name = {"Tarots"}, items = {rising_dead_tarot}}