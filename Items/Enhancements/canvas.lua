local canvas = {
    object_type = "Enhancement",
    key = 'canvas',
    atlas = 'enhancements_atlas',
    order = 6,
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,
    update = function(self, card, dt)
        if G.hand or G.play then
            if SMODS.has_enhancement(card, 'm_aij_canvas') then
                if not card.ability.aij_canvas_temp_suit or not card.ability.aij_canvas_temp_rank then
                    card.ability.aij_canvas_temp_suit = card.base.suit
                    card.ability.aij_canvas_temp_rank = card.base.value
                end
                local new_suit, new_rank
                local changed_random_aij_deck_skin = false
                if not card.debuff then
                    if card.area == G.play and G.play then
                        local k = card.rank
                        if k < #G.play.cards then
                            if (card.base.suit ~= G.play.cards[k+1].base.suit or card.base.value ~= G.play.cards[k+1].base.value) then
                                new_suit, new_rank = G.play.cards[k+1].base.suit, G.play.cards[k+1].base.value
                            end
                            if G.play.cards[k+1].ability.all_in_jest and G.play.cards[k+1].ability.all_in_jest.random_aij_deck_skin then
                                if not (card.ability.all_in_jest and card.ability.all_in_jest.random_aij_deck_skin == G.play.cards[k+1].ability.all_in_jest.random_aij_deck_skin) then
                                    card.ability.all_in_jest = card.ability.all_in_jest or {}
                                    card.ability.all_in_jest.random_aij_deck_skin = G.play.cards[k+1].ability.all_in_jest.random_aij_deck_skin
                                    changed_random_aij_deck_skin = true
                                end
                            else
                                if not (card.ability.all_in_jest and card.ability.all_in_jest.random_aij_deck_skin["Spades"] == nil) then
                                    card.ability.all_in_jest = card.ability.all_in_jest or {}
                                    card.ability.all_in_jest.random_aij_deck_skin = {}
                                    changed_random_aij_deck_skin = true
                                end
                            end
                        end
                    elseif card.area == G.hand and G.hand then
                        local k = card.rank
                        local k2 = k+1
                        while k2 <= #G.hand.cards do
                            -- card.highlighted can be nil, and in lua (false == nil) is false where we want it to be true
                            -- So using 'not not' to force correct boolean value
                            if (not not card.highlighted) == (not not G.hand.cards[k2].highlighted) then
                                if (card.base.suit ~= G.hand.cards[k2].base.suit or card.base.value ~= G.hand.cards[k2].base.value) then
                                    new_suit, new_rank = G.hand.cards[k2].base.suit, G.hand.cards[k2].base.value
                                end
                                if G.hand.cards[k2].ability.all_in_jest and G.hand.cards[k2].ability.all_in_jest.random_aij_deck_skin then
                                    card.ability.all_in_jest = card.ability.all_in_jest or {}
                                    if not (card.ability.all_in_jest and card.ability.all_in_jest.random_aij_deck_skin == G.hand.cards[k2].ability.all_in_jest.random_aij_deck_skin) then
                                        card.ability.all_in_jest = card.ability.all_in_jest or {}
                                        card.ability.all_in_jest.random_aij_deck_skin = G.hand.cards[k2].ability.all_in_jest.random_aij_deck_skin
                                        changed_random_aij_deck_skin = true
                                    end
                                else
                                    if not (card.ability.all_in_jest and card.ability.all_in_jest.random_aij_deck_skin["Spades"] == nil) then
                                        card.ability.all_in_jest = card.ability.all_in_jest or {}
                                        card.ability.all_in_jest.random_aij_deck_skin = {}
                                        changed_random_aij_deck_skin = true
                                    end
                                end
                                break
                            end
                            k2 = k2 + 1
                        end
                    end
                end
                if new_suit or new_rank or changed_random_aij_deck_skin then
                    assert(SMODS.change_base(card, new_suit, new_rank))
                end
                card.front_hidden = card:should_hide_front()
                if card:get_id() <= -50 then
                    card.base.nominal = 0
                else
                    local rank = SMODS.Ranks[card.base.value] or {}
                    card.base.nominal = rank.nominal or 0
                end
            end
        end
    end,
}
return {name = {"Enhancements"}, items = {canvas}}