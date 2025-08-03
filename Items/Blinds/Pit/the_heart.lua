local the_heart = {
    object_type = "Blind",
    key = 'the_heart',
    boss = {
      min = 4,
      hand = "[hand]",
      trigger = false,
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
      if G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante or G.GAME.won then
        if G.GAME.stake >= 5 or G.GAME.won then
            return true
        end
      end
    end,
    mult = 2,
    boss_colour = HEX("b18c8c"),
    atlas = 'blinds',
    pos = { y = 0 },
    order = 501,
    dollars = 6,

    loc_vars = function(self)
        local hands = {
            "Two Pair",
            "Flush",
            "Straight",
            "Three of a Kind"
        }
        if self.boss.hand == "[hand]" then
            self.boss.hand = pseudorandom_element(hands, pseudoseed('jest_the_heart_blind'..G.GAME.round_resets.ante))
        end
        return {
            vars = {
                self.boss.hand
            }
        }
    end,

    collection_loc_vars = function(self)
        local hand_text = "[hand]"
        return {
            vars = {
                hand_text
            }
        }
    end,

    debuff_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if G.GAME.hands[self.boss.hand].played_this_round > 0 then
            self.boss.trigger = true
        end
        if next(poker_hands[self.boss.hand]) or self.boss.trigger then
            return false     
        end
        return true
    end,
}
return { name = {"Pit Blinds"}, items = {the_heart} }
