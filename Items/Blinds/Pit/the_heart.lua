local the_heart = {
    object_type = "Blind",
    key = 'the_heart',
    boss = {
      min = 4,
      hand = "[hand]",
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
      return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 2,
    boss_colour = HEX("b18c8c"),
    atlas = 'blinds',
    pos = { y = 0 },
    order = 501,
    dollars = 6,
    config = {extra = {trigger = false,  hand = "[hand]"}},

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

    defeat = function(self)
        self.boss.hand = "[hand]"
    end,

    debuff_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        local blind_exists = G.GAME.blind and G.GAME.blind.ability
        if blind_exists then
            G.GAME.blind.ability.extra.hand = self.boss.hand
            if G.GAME.hands[G.GAME.blind.ability.extra.hand].played_this_round > 0 then
                G.GAME.blind.ability.extra.trigger = true
            end
            if next(poker_hands[G.GAME.blind.ability.extra.hand]) or G.GAME.blind.ability.extra.trigger then
                return false
            end
        end
        G.GAME.blind.triggered = true
        return true
    end,
}
return { name = {"Pit Blinds"}, items = {the_heart} }
