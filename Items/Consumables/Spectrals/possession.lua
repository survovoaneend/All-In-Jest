local possession = {
    object_type = "Consumable",
	key = 'possession',
	set = 'Spectral',
	pos = { x = 6, y = 3 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 1,
	config = { max_highlight = 1 },
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlight } }
	end,
    can_use = function(self, card)
        if G.hand and (#G.hand.highlighted <= card.ability.max_highlight and #G.hand.highlighted > 0) then
            for i = 1, #G.hand.highlighted do
                local hand_card = G.hand.highlighted[i]
                if hand_card.edition or hand_card.config.center.key ~= 'c_base' then
                    return true
                end
            end
            return false
        end
    end,
	use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4,
                func = function()
                    local triggered = false
                    local hand_card = G.hand.highlighted[i]
                    if hand_card.edition then
                        All_in_Jest.apply_inherent_effect(hand_card, hand_card.edition, 'edition')
                        hand_card:set_edition(nil, true)
                    end
                    if hand_card.config.center.key ~= 'c_base' then
                        All_in_Jest.apply_inherent_effect(hand_card, hand_card.config.center, 'enhancement')
                        hand_card:set_ability(G.P_CENTERS.c_base, nil, true)
                    end
                    if triggered then
                        hand_card:juice_up(0.3, 0.5)
                        play_sound('negative', 1.5, 0.4)
                    end
                    return true
                end
            }))
        end
    end,
}
return {name = {"Spectrals"}, items = {possession}}