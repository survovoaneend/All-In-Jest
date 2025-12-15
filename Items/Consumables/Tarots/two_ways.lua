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
                if G.hand.highlighted[i].base.id == 2 or G.hand.highlighted[i].base.id == 3 or SMODS.has_enhancement(G.hand.highlighted[i], 'm_aij_canvas') then
                    return false
                end
            end
            return true
        end
    end,
    use = function(self, card)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        delay(0.2)
        local new_cards = {}
        G.E_MANAGER:add_event(Event({func = function()
            for i = 1, #G.hand.highlighted do
                local hand_card = G.hand.highlighted[i]
                local hand_card_index = 1
                for j = 1, #G.hand.cards do
                    if G.hand.cards[j] == hand_card then
                      hand_card_index = j
                    end
                end
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(hand_card, nil, nil, G.playing_card)

                local new_rank_id_for_clone = math.max(2, math.min(math.ceil(hand_card.base.id / 2), 14))
                local new_rank_id_for_original = math.max(2, math.min(math.floor(hand_card.base.id / 2), 14))

                assert(SMODS.modify_rank(new_card, -new_rank_id_for_clone))
                assert(SMODS.modify_rank(hand_card, -new_rank_id_for_original))

                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, new_card)
                G.hand:emplace(new_card)
                table.remove(G.hand.cards, #G.hand.cards)
                table.insert(G.hand.cards, hand_card_index + 1, new_card)
                G.hand:set_ranks()

                table.insert(new_cards, new_card)
                -- new_card.states.visible = nil
            end
            for i = 1, #new_cards do
                new_cards[i]:highlight(true)
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- new_card:start_materialize()
                    playing_card_joker_effects({ new_cards })
                    return true
                end
            }))
        return true end }))
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.5, func = function() 
            G.hand:unhighlight_all()
            for i = 1, #new_cards do
                new_cards[i]:highlight(false)
            end
            return true
        end }))
        delay(0.2)
    end,
}
return { name = { "Tarots" }, items = { two_ways } }
