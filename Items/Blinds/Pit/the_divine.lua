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
        if All_in_Jest.pit_blinds_in_play() then
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
    end,
    mult = 2,
    boss_colour = HEX("d9d9d9"),
    atlas = 'blinds_pit',
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
            G.GAME.blind.triggered = true
            return true
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_divine} }
