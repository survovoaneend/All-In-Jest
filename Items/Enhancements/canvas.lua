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
                for k, v in pairs(G.play.cards) do
                    if v == card and v ~= G.play.cards[#G.play.cards] then
                        if card.base.suit ~= G.play.cards[k+1].base.suit or card.base.value ~= G.play.cards[k+1].base.value then
                            SMODS.change_base(card, G.play.cards[k+1].base.suit, G.play.cards[k+1].base.value)
                        end
                    end
                end
                local highlighted = false
                local highlighted_cards = {}
                for k, v in pairs(G.hand.cards) do
                    for key, val in pairs(G.hand.highlighted) do
                        if v == val then
                            highlighted_cards[#highlighted_cards+1] = v
                        end
                    end
                end
                for k, v in pairs(highlighted_cards) do
                    if v == card then
                        highlighted = true
                        if v ~= highlighted_cards[#highlighted_cards] then
                            if card.base.suit ~= highlighted_cards[k+1].base.suit or card.base.value ~= highlighted_cards[k+1].base.value then
                                SMODS.change_base(card, highlighted_cards[k+1].base.suit, highlighted_cards[k+1].base.value)
                                card.front_hidden = card:should_hide_front()
                            end
                        end
                    end
                end
                if not highlighted then
                    for k, v in pairs(G.hand.cards) do
                        if v == card and v ~= G.hand.cards[#G.hand.cards] then
                            if card.base.suit ~= G.hand.cards[k+1].base.suit or card.base.value ~= G.hand.cards[k+1].base.value then
                                SMODS.change_base(card, G.hand.cards[k+1].base.suit, G.hand.cards[k+1].base.value)
                            end
                        end
                    end
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