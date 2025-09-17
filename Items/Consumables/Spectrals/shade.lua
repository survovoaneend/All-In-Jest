local shade_spectral = {
    object_type = "Consumable",
	key = 'shade',
	set = 'Spectral',
	pos = { x = 4, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 1,
	config ={},
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'e_negative_playing_card', set = 'Edition', config = {extra = G.P_CENTERS['e_negative'].config.card_limit} }
	end,
    can_use = function(self, card)
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
            for k, v in ipairs(G.hand.cards) do
            if not v.edition then 
                return true 
            end
        end
        else
            return false
        end
    end,
	use = function(self, card, area, copier)
        local cards = {}
        for k, v in ipairs(G.hand.cards) do
            if not v.edition then cards[#cards + 1] = v end
        end
        local _card = pseudorandom_element(cards, pseudoseed('shade_card'))
        G.E_MANAGER:add_event(Event({
            trigger = 'before', 
            delay = 0.2,
            func = function()
                card:juice_up(0.6, 0.2)
                _card:juice_up(0.6, 0.2)
                play_sound('negative', 1.5, 0.4)
                _card:set_edition({negative = true}, true, true) 
                if G.deck and #G.deck.cards > 0 then
                    draw_card(G.deck,G.hand, nil,'up', nil, nil)
                end
                return true
            end
        }))
    end,
}
return {name = {"Spectrals"}, items = {shade_spectral}}