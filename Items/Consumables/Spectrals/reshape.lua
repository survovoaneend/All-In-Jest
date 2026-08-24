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
        if G.jokers and G.jokers.cards and #G.jokers.cards/2 > 1 then 
            return true 
        end
        return false
    end,
	use = function(self, card, area, copier)
        local targets = {}
        for i = #G.jokers.cards, math.floor(#G.jokers.cards/2)+1, -1 do
            targets[#targets+1] = G.jokers.cards[i]
        end
        local selected_joker = pseudorandom_element(targets, pseudoseed('reshape'))
        G.E_MANAGER:add_event(Event({
            trigger = 'after', 
            delay = 0.4, 
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true 
            end 
        }))
        for i=1, #targets do
            local percent = 1.15 - (i-0.999)/(#targets-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    targets[i]:flip()
                    play_sound('card1', percent)
                    targets[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
        for i=1, #targets do
            G.E_MANAGER:add_event(Event({
                func = function()
                    if targets[i] ~= selected_joker then
                        local original_edition = targets[i].edition or {}
                        local original_stickers = {}
                        for k, _ in pairs(G.shared_stickers) do
                            if targets[i].ability[k] then
                                original_stickers[k] = targets[i].ability[k]
                                if k == "perishable" then
                                    original_stickers["perish_tally"] = targets[i].ability.perish_tally or 5
                                end
                            end
                        end
                        targets[i]:remove_from_deck(true)
                        targets[i]:set_edition(nil, true, true)
                        copy_card(selected_joker, targets[i], nil, nil, true)
                        targets[i]:set_edition(original_edition, true, true)
                        targets[i]:add_to_deck(true)
                        for k, _ in pairs(G.shared_stickers) do
                            if original_stickers[k] then
                                targets[i].ability[k] = original_stickers[k]
                            else
                                -- Handle unusual and recherche stickers
                                if type(targets[i].ability[k]) == "table" and targets[i].ability[k].mult then
                                    targets[i].ability[k].mult = tostring(1)
                                    targets[i]:update(0)
                                end
                                targets[i].ability[k] = nil
                            end
                        end
                    end
                    return true
                end
            }))
        end
        for i=1, #targets do
            local percent = 0.85 + (i-0.999)/(#targets-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    targets[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    targets[i]:juice_up(0.3, 0.3)
                    return true
                end 
            }))
        end
        delay(0.5)
    end,
}
return {name = {"Spectrals"}, items = {reshape}}