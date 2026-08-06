local the_pair = {
    object_type = "Blind",
    key = 'the_pair',
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
    boss_colour = HEX("82bee4"),
    atlas = 'blinds_pit',
    pos = { y = 16 },
    order = 517,
    dollars = 6,
    config = {},

    debuff_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        local cards = {}
        for k, v in pairs(G.hand.cards) do
            if not v.highlighted then
                cards[#cards+1] = v
            end
        end
        local hand_text,disp_text,hand_poker_hands = G.FUNCS.get_poker_hand_info(cards)
        local current_hand_is_matching = next(hand_poker_hands['Pair'])
        if current_hand_is_matching then
            return false
        end
        G.GAME.blind.triggered = true
        return true
    end,
}
return { name = {"Pit Blinds"}, items = {the_pair} }
