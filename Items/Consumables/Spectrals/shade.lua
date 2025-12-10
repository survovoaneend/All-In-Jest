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
        if All_in_Jest.config and All_in_Jest.config.no_copy_neg then
            info_queue[#info_queue+1] = {key = 'e_negative_playing_card', set = 'Edition', config = {extra = G.P_CENTERS['e_negative'].config.card_limit} }
        else
            info_queue[#info_queue+1] = G.P_CENTERS.e_aij_negative_playing_card
        end
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
        local selected_card = pseudorandom_element(cards, pseudoseed('shade_card'))
        G.E_MANAGER:add_event(Event({
            trigger = 'after', 
            delay = 0.4,
            func = function()
                card:juice_up(0.3, 0.5)
                play_sound('negative', 1.5, 0.4)
                selected_card:set_edition({negative = true}, true)
                G.FUNCS.draw_from_deck_to_hand(math.min(1, (G.hand.config.card_limit + 1) - #G.hand.cards))
                -- G.hand:handle_card_limit()
                -- if G.deck and #G.deck.cards > 0 then
                --     draw_card(G.deck, G.hand, nil, 'up', nil, nil)
                -- end
                return true
            end
        }))
    end,
}
return {name = {"Spectrals"}, items = {shade_spectral}}