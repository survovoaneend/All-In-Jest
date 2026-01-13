local faceless = {
    object_type = "Consumable",
    key = 'faceless',
    set = 'Tarot',
    pos = { x = 3, y = 8 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_tarot_hex'), HEX('4f6367'), G.C.WHITE, 1.2)
    end,
    cost = 6,
    unlocked = true,
    discovered = false,
    hidden = true,
    soul_rate = 0.01,
    soul_set = 'Tarot',
    order = 504,
    config = { },
    atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
       
    end,
    can_use = function(self, card)
        if G.jokers and #G.jokers.cards >= 1 and not SMODS.is_eternal(G.jokers.cards[1]) then
	        return true
        end
    end,
    use = function(self, card)
        local rarity = G.jokers.cards[1].config.center.rarity
        SMODS.destroy_cards(G.jokers.cards[1])
        if rarity == 4 then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.2,
                func = function()
                    card:juice_up()
                    local temp_card = create_card('Joker', G.jokers, nil, 1, nil, nil, nil, 'faceless')
                    temp_card:set_edition({negative = true})
                    temp_card:start_materialize()
                    G.jokers:emplace(temp_card)
                    return true
                end
            }))
        elseif rarity == 3 then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.2,
                func = function()
                    card:juice_up()
                    local temp_card = create_card('Joker', G.jokers, nil, 0.9, nil, nil, nil, 'faceless')
                    temp_card:set_edition({negative = true})
                    temp_card:start_materialize()
                    G.jokers:emplace(temp_card)
                    return true
                end
            }))
        elseif rarity == 2 then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.2,
                func = function()
                    card:juice_up()
                    local temp_card = create_card('Joker', G.jokers, nil, 0.6, nil, nil, nil, 'faceless')
                    temp_card:set_edition({negative = true})
                    temp_card:start_materialize()
                    G.jokers:emplace(temp_card)
                    return true
                end
            }))
        else
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = HEX('4f6367')})
        end
    end,
}
return { name = { "Tarots" }, items = { faceless } }
