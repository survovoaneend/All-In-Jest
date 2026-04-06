local reaper = {
    object_type = "Consumable",
	key = 'reaper',
	set = 'Tarot',
	pos = { x = 15, y = 2 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 12,
	config = { max_highlight = 3 },
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
            return true
        end
    end,
	use = function(self, card)
        local new_card = pseudorandom_element(G.hand.highlighted, pseudoseed('reaper'))
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
					copy_card(new_card, G.hand.highlighted[i])
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
return {name = {"Tarots"}, items = {reaper}}