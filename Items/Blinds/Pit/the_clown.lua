local the_clown = {
    object_type = "Blind",
    key = 'the_clown',
    boss = {
      min = 4,
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
        return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 2,
    boss_colour = HEX("e8dede"),
    atlas = 'blinds_pit',
    pos = {y = 19},
    order = 520,
    dollars = 6,
    config = {},

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.first_hand_drawn and not temp then
            local cards = {}
            for k, v in pairs(G.hand.cards) do
                cards[k] = k
            end
            local val = math.min(#G.hand.cards, 5)
            while #G.hand.highlighted < val do
                local index = pseudorandom_element(cards, pseudoseed('jest_the_clown'))
                G.hand.cards[index].ability.aij_temp_always_scores = true
                G.hand:add_to_highlighted(G.hand.cards[index])
                cards[index] = nil
            end
            G.FUNCS.play_cards_from_highlighted(nil, true)
            ease_hands_played(1)
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
return { name = {"Pit Blinds"}, items = {the_clown} }
