local fallen_falcon = {
    object_type = "Blind",
    key = 'fallen_falcon',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    boss_colour = HEX("ac7e5b"),
    atlas = 'blinds_final',
    ignore = true,
    pos = { y = 7},
    order = 1008,
    dollars = 8,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.first_hand_drawn and not temp then
            local hand_text,disp_text,hand_poker_hands, hand_scoring_hand = G.FUNCS.get_poker_hand_info(G.hand.cards)
            for k, v in pairs(hand_scoring_hand) do
                G.hand:add_to_highlighted(v)
            end
            G.FUNCS.play_cards_from_highlighted(nil, true)
            G.GAME.aij_add_next_hand_to_blind = true
        end
        if context.after and not temp then
            if G.GAME.aij_add_next_hand_to_blind then
                G.GAME.aij_add_next_hand_to_blind = nil
                G.E_MANAGER:add_event(Event({
                  trigger = 'ease',
                  blocking = false,
                  ref_table = G.GAME,
                  ref_value = 'chips',
                  ease_to = 0,
                  delay =  0.5,
                  func = (function(t) return math.floor(t) end)
                }))
                All_in_Jest.ease_blind_requirement(nil, G.GAME.all_in_jest.advanced_hand_usage_blind[1].total_chips)
                blind.triggered = true
            end
        end
    end,

    disable = function(self)
        ease_hands_played(1)
        if G.GAME.all_in_jest.advanced_hand_usage_blind[1] then
            All_in_Jest.ease_blind_requirement(nil, -G.GAME.all_in_jest.advanced_hand_usage_blind[1].total_chips)
        end
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if G.GAME.all_in_jest.advanced_hand_usage_blind[1] then
            All_in_Jest.ease_blind_requirement(nil, -G.GAME.all_in_jest.advanced_hand_usage_blind[1].total_chips)
        end
    end
}
return { name = {"Finisher Blinds"}, items = {fallen_falcon} }
