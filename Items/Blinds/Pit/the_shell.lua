local the_shell = {
    object_type = "Blind",
    key = 'the_shell',
    boss = {
      min = 4,
      odds = 4,
      odds2 = 3,
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
        return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 2,
    boss_colour = HEX("cca7b2"),
    atlas = 'blinds_pit',
    pos = { y = 4 },
    order = 505,
    dollars = 6,

    loc_vars = function(self)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, self.boss.odds)
        local numerator2, denominator2 = SMODS.get_probability_vars(self, 1, self.boss.odds2)

        return {
            vars = {numerator, denominator, numerator2, denominator2}
        }
    end,

    collection_loc_vars = function(self)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, self.boss.odds)
        local numerator2, denominator2 = SMODS.get_probability_vars(self, 1, self.boss.odds2)

        return {
            vars = {numerator, denominator, numerator2, denominator2}
        }
    end,

    set_blind = function(self)
        for k, v in pairs(G.playing_cards) do
            if SMODS.pseudorandom_probability(self, 'the_shell', 1, G.GAME.blind.config.blind.boss.odds) then
                SMODS.debuff_card(v, true, 'the_shell')
            end
        end
    end,

    stay_flipped = function(self, area, card)
        if area == G.hand then
            if SMODS.pseudorandom_probability(self, 'the_shell', 1, G.GAME.blind.config.blind.boss.odds2) then
                return true
            end
        end
    end,

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_shell')
        end
        for k, v in pairs(G.hand.cards) do
            if v.facing == 'back' then
                v:flip()
            end
            for k, v in pairs(G.playing_cards) do
                v.ability.wheel_flipped = nil
            end
        end
    end,

    defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_shell')
        end
        for k, v in pairs(G.hand.cards) do
            if v.facing == 'back' then
                v:flip()
            end
            for k, v in pairs(G.playing_cards) do
                v.ability.wheel_flipped = nil
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_shell} }
