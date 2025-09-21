local palmistry = {
    object_type = "Consumable",
	key = 'palmistry',
	set = 'Spectral',
    atlas = 'consumable_atlas',
	pos = { x = 6, y = 2 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 0,
	config ={ hand_size = 1 },
    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.consumeable.hand_size
			},
		}
    end,
    can_use = function(self, card)
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
            return true 
        end
        return false
    end,
	use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.cards do
            local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        local cen_pool = {}
        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
            if v.key ~= 'm_stone' then 
                cen_pool[#cen_pool+1] = v
            end
        end
        for k, v in ipairs(G.hand.cards) do
            local enhance = pseudorandom_element(cen_pool, pseudoseed('palmistry'..G.GAME.round_resets.ante)).key
            G.E_MANAGER:add_event(Event({func = function()
                v:set_ability(G.P_CENTERS[enhance])
            return true end }))
        end
        G.hand:change_size(-card.ability.consumeable.hand_size)
        for i=1, #G.hand.cards do
            local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.5)
    end,
}
return {name = {"Spectrals"}, items = {palmistry}}