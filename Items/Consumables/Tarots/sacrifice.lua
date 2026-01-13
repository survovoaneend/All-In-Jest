local sacrifice = {
    object_type = "Consumable",
	key = 'sacrifice',
	set = 'Tarot',
	pos = { x = 14, y = 2 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 11,
	config = { max_highlight = 1 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.max_highlight,
			}
		}
	end,
	can_use = function(self, card)
        if G.hand and (#G.hand.highlighted <= card.ability.max_highlight and #G.hand.highlighted > 0) then
            return true
        end
    end,
	use = function(self, card)
        local destroy_card = G.hand.highlighted[1]
        SMODS.destroy_cards(destroy_card, nil, true)
        G.E_MANAGER:add_event(Event({
            func = function()
				local cen_pool = {}
                for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                    if v.key ~= 'm_stone' then 
                        cen_pool[#cen_pool+1] = v
                    end
                end
                local _card = create_playing_card({
                    front = pseudorandom_element(G.P_CARDS, pseudoseed('sacrifice')),
                    center = pseudorandom_element(cen_pool, pseudoseed('sacrifice'))}, G.hand, nil, nil, {G.C.SECONDARY_SET.Enhanced})
                G.GAME.blind:debuff_card(_card)
                G.hand:sort()
                playing_card_joker_effects({_card})
                _card:juice_up(0.3, 0.5)
                return true
            end
        }))
    end,
}
return {name = {"Tarots"}, items = {sacrifice}}