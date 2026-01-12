local tallow = {
    object_type = "Consumable",
	key = 'tallow',
	set = 'Spectral',
    atlas = 'consumable_atlas',
	pos = { x = 17, y = 2 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 12,
    config = { extra = { mod_conv = 'aij_melted',}, max_highlighted = 2 },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.mod_conv]
		return {
			vars = {
				card.ability.max_highlighted,
				localize { type = 'name_text', set = 'Other', key = card.ability.extra.mod_conv..'_seal' },
                colours = {
                    HEX("a28b8b"),
                }
			}
		}
	end,
	use = function(self, card)
        G.E_MANAGER:add_event(Event({func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for i = 1, #G.hand.highlighted do
                local conv_card = G.hand.highlighted[i]
                conv_card:set_seal(card.ability.extra.mod_conv, nil, true)
            end
            return true end }))
        
        delay(0.5)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end,
}
return {name = {"Spectrals"}, items = {tallow}}