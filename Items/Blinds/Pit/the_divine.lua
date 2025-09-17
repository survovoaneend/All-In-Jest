local the_divine = {
    object_type = "Blind",
    key = 'the_divine',
    boss = {
      min = 4,
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
        if G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante or G.GAME.won then
            if G.GAME.stake >= 5 or G.GAME.won or not All_in_Jest.config.blue_stake_rework then
                if G.playing_cards then
                    local count = 0
                    for k, v in ipairs(G.playing_cards) do
                        if next(SMODS.get_enhancements(v)) then
                            count = count + 1
                        end
                    end
                    return count >= 4
                end
            end
        end
    end,
    mult = 2,
    boss_colour = HEX("d9d9d9"),
    atlas = 'blinds',
    pos = { y = 10 },
    order = 511,
    dollars = 6,

    debuff_hand = function(self, cards, hand, handname, check)
        if cards then
            for k, v in ipairs(cards) do
                if next(SMODS.get_enhancements(v)) then
                    return false
                end
            end
            return true
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_divine} }
