local the_mountain = {
    object_type = "Blind",
    key = 'the_mountain',
    boss = {
      min = 4,
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
    mult = 6,
    boss_colour = HEX("a7a5a3"),
    atlas = 'blinds',
    pos = {X = 0, y = 7 },
    order = 508,
    dollars = 6,

    set_blind = function(self)
        G.hand:change_size(1)
    end,

    disable = function(self)
        G.hand:change_size(-1)
        G.GAME.blind.chips = G.GAME.blind.chips/3
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if not temp then
            G.hand:change_size(-1)
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_mountain} }
