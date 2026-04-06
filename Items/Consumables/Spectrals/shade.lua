local shade_spectral = {
    object_type = "Consumable",
    key = 'shade',
    set = 'Spectral',
    pos = { x = 4, y = 4 },
    cost = 4,
    unlocked = true,
    discovered = false,
    order = 1,
    config = { extra = 1 },
    atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
        if All_in_Jest.config and All_in_Jest.config.no_copy_neg then
            info_queue[#info_queue+1] = {key = 'e_negative_playing_card', set = 'Edition', config = {extra = G.P_CENTERS['e_negative'].config.card_limit} }
        else
            info_queue[#info_queue+1] = G.P_CENTERS.e_aij_negative_playing_card
        end
        return {vars = { card.ability.extra }}
	  end,
    can_use = function(self, card)
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
            for k, v in ipairs(G.hand.cards) do
            if not v.edition then 
                return true 
            end
        end
        else
            return false
        end
    end,
	  use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after', 
            delay = 0.4,
            func = function()
                local activations = 0
                local i = 0
                local valid_cards_remain = true
                while activations < card.ability.extra and valid_cards_remain do
                    sendDebugMessage(i, "AIJ")
                    local selected_card = pseudorandom_element(G.hand.cards, pseudoseed('shade_card' .. i))
                    if not selected_card.edition then
                        card:juice_up(0.3, 0.5)
                        play_sound('negative', 1.5, 0.4)
                        selected_card:set_edition({negative = true}, true)
                        -- G.FUNCS.draw_from_deck_to_hand(math.min(1, (G.hand.config.card_limit + 1) - #G.hand.cards))
                        activations = activations + 1
                    end

                    valid_cards_remain = false
                    if G.hand and G.hand.cards and #G.hand.cards > 0 then
                        for _, v in ipairs(G.hand.cards) do
                            if not v.edition then
                                valid_cards_remain = true
                                break
                            end
                        end
                    end

                    i = i + 1
                end
                return true
            end
        }))
    end,
}
return {name = {"Spectrals"}, items = {shade_spectral}}