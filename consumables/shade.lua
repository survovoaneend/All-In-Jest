SMODS.Consumable {
	key = 'shade',
	set = 'Spectral',
	pos = { x = 4, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = true,
	config = {max_highlighted = 1},
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'e_negative_playing_card', set = 'Edition', config = {extra = G.P_CENTERS['e_negative'].config.card_limit} }
	end,
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area, copier)
        local edition = {negative = true}
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
                local highlighted = G.hand.highlighted[i]
                highlighted:set_edition(edition, true)
            return true end }))
        end
        card:juice_up(0.3, 0.5)
    end,

    
	
}