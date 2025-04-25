SMODS.Consumable {
	key = 'shade',
	set = 'Spectral',
	pos = { x = 4, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
	config ={},
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'e_negative_playing_card', set = 'Edition', config = {extra = G.P_CENTERS['e_negative'].config.card_limit} }
	end,
    can_use = function(self, card)
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
            return true
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
        local edition = {negative = true}
    
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
                _card:set_edition(edition, true)
            return true end }))
        card:juice_up(0.3, 0.5)
    end,

    
	
}