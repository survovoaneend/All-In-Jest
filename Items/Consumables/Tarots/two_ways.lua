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
        local rank_id_to_name = {
            [2] = '2',
            [3] = '3',
            [4] = '4',
            [5] = '5',
            [6] = '6',
            [7] = '7',
            [8] = '8',
            [9] = '9',
            [10] = '10',
            [11] = 'Jack',
            [12] = 'Queen',
            [13] = 'King',
            [14] = 'Ace'
        }

        for i = 1, #G.hand.highlighted do
            local hand_card = G.hand.highlighted[i]
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local _card = copy_card(hand_card, nil, nil, G.playing_card)

            local new_rank_id_for_clone = math.max(2, math.min(math.floor(hand_card.base.id / 2), 14))
            local new_rank_id_for_original = math.max(2, math.min(math.ceil(hand_card.base.id / 2), 14))

            local new_rank_name_for_clone = rank_id_to_name[new_rank_id_for_clone]
            local new_rank_name_for_original = rank_id_to_name[new_rank_id_for_original]

            assert(SMODS.change_base(_card, nil, new_rank_name_for_clone))
            assert(SMODS.change_base(hand_card, nil, new_rank_name_for_original))

            _card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, _card)
            G.hand:emplace(_card)
            _card.states.visible = nil

            G.E_MANAGER:add_event(Event({
                func = function()
                    _card:start_materialize()
                    playing_card_joker_effects({ _card })
                    return true
                end
            }))
        end
    end,
}
return { name = { "Tarots" }, items = { two_ways } }
