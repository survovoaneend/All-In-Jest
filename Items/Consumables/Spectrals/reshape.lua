local reshape = {
    object_type = "Consumable",
	key = 'reshape',
	set = 'Spectral',
    atlas = 'consumable_atlas',
	pos = { x = 7, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 9,
	config ={},
    can_use = function(self, card)
        if G.jokers and G.jokers.cards and #G.jokers.cards > 1 then 
            return true 
        end
        return false
    end,
	use = function(self, card, area, copier)
        local selected_joker = pseudorandom_element(G.jokers.cards, pseudoseed('reshape'))
        G.E_MANAGER:add_event(Event({
            trigger = 'after', 
            delay = 0.4, 
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true 
            end 
        }))
        for i=1, #G.jokers.cards do
            local percent = 1.15 - (i-0.999)/(#G.jokers.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    G.jokers.cards[i]:flip()
                    play_sound('card1', percent)
                    G.jokers.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
        for i=1, #G.jokers.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.jokers.cards[i] ~= selected_joker then
                        copy_card(selected_joker, G.jokers.cards[i])
                    end
                    return true
                end
            }))
        end
        for i=1, #G.jokers.cards do
            local percent = 0.85 + (i-0.999)/(#G.jokers.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.jokers.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.jokers.cards[i]:juice_up(0.3, 0.3)
                    return true
                end 
            }))
        end
        delay(0.5)
    end,
}
return {name = {"Spectrals"}, items = {reshape}}