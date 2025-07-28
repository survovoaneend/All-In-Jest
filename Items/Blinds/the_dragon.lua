local the_dragon = {
    object_type = "Blind",
    key = 'the_dragon',
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
    mult = 2,
    boss_colour = HEX("95a996"),
    atlas = 'blinds',
    pos = {X = 0, y = 6 },
    order = 507,
    dollars = 6,
}
return { name = {"Pit Blinds"}, items = {the_dragon} }
