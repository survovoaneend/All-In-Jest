local the_heart = {
    object_type = "Blind",
    key = 'the_heart',
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
    boss_colour = HEX("b18c8c"),
    atlas = 'blinds_pit',
    pos = { y = 0 },
    order = 501,
    dollars = 6,
    config = {extra = {trigger = false,  hand = "[hand]"}},

    loc_vars = function(self)
        return {
            vars = {
                G.GAME.current_round.aij_the_heart and G.GAME.current_round.aij_the_heart.hand or "[hand]"
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
            local current_hand_is_matching = next(poker_hands[G.GAME.current_round.aij_the_heart.hand])
            local previous_hand_matched = G.GAME.hands[G.GAME.current_round.aij_the_heart.hand].played_this_round > 0
            if current_hand_is_matching or previous_hand_matched then
                return false
            end
        end
        G.GAME.blind.triggered = true
        return true
    end,
}
return { name = {"Pit Blinds"}, items = {the_heart} }
