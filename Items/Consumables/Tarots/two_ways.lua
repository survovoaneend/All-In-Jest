local two_ways = {
    object_type = "Consumable",
	key = 'two_ways',
	set = 'Tarot',
	pos = { x = 5, y = 6 },
	cost = 3,
    
	unlocked = true,
	discovered = false,
	order = 5,
	config = { max_highlight = 1 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.max_highlight } }
	end,
	can_use = function(self, card, area, copier)
        if G.hand and (#G.hand.highlighted <= card.ability.max_highlight and #G.hand.highlighted > 0) then
            for i = 1, #G.hand.highlighted do
                if G.hand.highlighted[i].base.id == 2 or G.hand.highlighted[i].base.id == 3 then
                    return false
                end
            end
            return true 
        end
    end,
    use = function(self, card)
        for i = 1, #G.hand.highlighted do
            local hand_card = G.hand.highlighted[i]
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local _card = copy_card(hand_card, nil, nil, G.playing_card)
            local _suit = string.sub(hand_card.base.suit, 1, 1)..'_'
            local rank_suffix = math.min(math.floor(hand_card.base.id / 2), 14)
            local hand_card_rs = math.min(math.ceil(hand_card.base.id / 2), 14)
            if rank_suffix < 10 then rank_suffix = tostring(rank_suffix)
            elseif rank_suffix == 10 then rank_suffix = 'T'
            elseif rank_suffix == 11 then rank_suffix = 'J'
            elseif rank_suffix == 12 then rank_suffix = 'Q'
            elseif rank_suffix == 13 then rank_suffix = 'K'
            elseif rank_suffix == 14 then rank_suffix = 'A'
            end
            _card:set_base(G.P_CARDS[_suit..rank_suffix])
            hand_card:set_base(G.P_CARDS[_suit..hand_card_rs])
            _card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, _card)
            G.hand:emplace(_card)
            _card.states.visible = nil

            G.E_MANAGER:add_event(Event({
                func = function()
                    _card:start_materialize()
                    playing_card_joker_effects({_card})
                    return true
                end
            })) 
        end
    end,
}
return {name = {"Tarots"}, items = {two_ways}}