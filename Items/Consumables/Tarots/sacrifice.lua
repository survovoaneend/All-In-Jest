local sacrifice = {
    object_type = "Consumable",
	key = 'sacrifice',
	set = 'Tarot',
	pos = { x = 14, y = 2 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 11,
	config = { max_highlighted = 1 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.max_highlighted,
			}
		}
	end,
	can_use = function(self, card)
        if G.hand and (#G.hand.highlighted <= card.ability.max_highlighted and #G.hand.highlighted > 0) then
            return true
        end
    end,
	use = function(self, card)
        SMODS.destroy_cards(G.hand.highlighted, nil, true)
        G.E_MANAGER:add_event(Event({
            func = function()
                local front = pseudorandom_element(G.P_CARDS, pseudoseed('sacrifice'))
                local enhance = SMODS.poll_enhancement({guaranteed = true, no_replace = true, key = 'sacrifice'})
                local _card = create_playing_card({
                    front = front,
                    center = G.P_CENTERS[enhance]}, G.hand, nil, nil, {G.C.SECONDARY_SET.Enhanced})
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