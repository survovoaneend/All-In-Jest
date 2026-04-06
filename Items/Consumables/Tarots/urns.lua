local urns = {
    object_type = "Consumable",
	key = 'urns',
	set = 'Tarot',
	pos = { x = 16, y = 2 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 13,
	config = { max_highlight = 1, ran_cards = 3 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.max_highlight,
				card.ability.ran_cards,
			}
		}
	end,
	can_use = function(self, card)
        if G.hand and #G.hand.cards >= card.ability.ran_cards and (#G.hand.highlighted <= card.ability.max_highlight and #G.hand.highlighted > 0) then
			if G.hand.highlighted[1].config.center ~= G.P_CENTERS.c_base then
				return true
			end
        end
    end,
	use = function(self, card)
        local center_key = G.hand.highlighted[1].config.center.key
        local destroy_card = G.hand.highlighted[1]
        SMODS.destroy_cards(destroy_card, nil, true)
		local valid_cards = {}
		for k, v in pairs(G.hand.cards) do
			valid_cards[#valid_cards+1] = v
		end
		local selected_cards = {}
		for i = 1, card.ability.ran_cards do
			local cur_card = pseudorandom_element(valid_cards, pseudoseed('urns'))
			for k, v in pairs(valid_cards) do
				if v == cur_card then
					valid_cards[k] = nil
				end
			end
			selected_cards[#selected_cards+1] = cur_card
		end
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #selected_cards do
            local percent = 1.15 - (i-0.999)/(#selected_cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() selected_cards[i]:flip();play_sound('card1', percent);selected_cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({
            func = function()
				for i = 1, #selected_cards do
					selected_cards[i]:set_ability(G.P_CENTERS[center_key])
				end
                return true
            end
        }))
		for i=1, #selected_cards do
            local percent = 0.85 + (i-0.999)/(#selected_cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() selected_cards[i]:flip();play_sound('tarot2', percent, 0.6);selected_cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        delay(0.5)
    end,
}
return {name = {"Tarots"}, items = {urns}}