local scopophobia = {
    object_type = "Consumable",
	key = 'scopophobia',
	set = 'Spectral',
    atlas = 'consumable_atlas',
	pos = { x = 0, y = 7 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 8,
	config ={},
    can_use = function(self, card)
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
            local viable_options = {}
            for k, v in pairs(G.jokers.cards) do
                if G.jokers.cards[k] and not SMODS.is_eternal(G.jokers.cards[k]) then
                    viable_options[#viable_options+1] = v
                end
            end
            if #viable_options > 0 then
                return true
            end
        end
        return false
    end,
	use = function(self, card, area, copier)
        local viable_options = {}
        for k, v in pairs(G.jokers.cards) do
            if G.jokers.cards[k] and not SMODS.is_eternal(G.jokers.cards[k]) then
                viable_options[#viable_options+1] = v
            end
        end
        local _card = pseudorandom_element(viable_options, pseudoseed('scopophobia'))

        local destroyed_cards = {}
        for k, v in ipairs(G.hand.cards) do 
            destroyed_cards[#destroyed_cards+1] = v
        end

        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end 
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function() 
                for i=#destroyed_cards, 1, -1 do
                    local card = destroyed_cards[i]
                    if SMODS.shatters(card) then
                        card:shatter()
                    else
                        card:start_dissolve(nil, i == #destroyed_cards)
                    end
                end
                return true
            end 
        }))
        delay(0.3)
        SMODS.calculate_context({ remove_playing_cards = true, removed = destroyed_cards })
        SMODS.destroy_card(_card, false, true)
    end,
}
return {name = {"Spectrals"}, items = {scopophobia}}