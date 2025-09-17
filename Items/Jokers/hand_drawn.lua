local hand_drawn = {
    object_type = "Joker",
    order = 76,

    key = "hand_drawn",
    config = {
      
    },
    rarity = 3,
    pos = { x = 21, y = 2 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local _planet, _hand, _tally = nil, nil, 0
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                _hand = v
                _tally = G.GAME.hands[v].played
            end
        end
        return {
            vars = {
                _hand
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local cards = {}
            for k, v in pairs(SMODS.drawn_cards) do
                cards[k] = v
            end
            for k, v in pairs(G.hand.cards) do
                cards[k] = v
            end
            local _planet, _hand, _tally = nil, nil, 0
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            if _hand then
                local trigger = false
                local fake_text,fake_disp_text,fake_poker_hands,fake_scoring_hand,fake_non_loc_disp_text = G.FUNCS.get_poker_hand_info(cards)
                if next(fake_poker_hands[_hand]) then
                    trigger = true
                    return
                end
                local drawn_cards = {}
                local cur_cards = {}
                for i = #G.deck.cards, 1, -1 do
                    if trigger then break end
                        
                    table.insert(drawn_cards, G.deck.cards[i])
                    draw_card(G.deck,G.hand, 90,'up', nil)

                    cur_cards = {}
                    for _, v in ipairs(drawn_cards) do
                        table.insert(cur_cards, v)
                    end
                    for _, v in ipairs(G.hand.cards) do
                        table.insert(cur_cards, v)
                    end

                    local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(cur_cards)
                    if next(poker_hands[_hand]) then
                        trigger = true
                        break
                    end
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {hand_drawn} }