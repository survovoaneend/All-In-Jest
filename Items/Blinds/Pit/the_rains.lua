local the_rains = {
    object_type = "Blind",
    key = 'the_rains',
    ignore = true,
    boss = {
      min = 4,
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
    boss_colour = HEX("869ca7"),
    atlas = 'blinds',
    pos = { y = 1 },
    order = 502,
    dollars = 6,

    calculate = function(self, card, context)
        --if G.GAME.chips and G.GAME.blind and not self.boss.trigger then
        --    local chipsthing = G.GAME.chips / G.GAME.blind.chips >= to_big(1)
        --    if G.play and G.play.cards and chipsthing then
        --        print(G.play.cards)
        --        for i = 1, #G.play.cards do
        --            print("-----------------")
        --            print(i)
        --            print("..................")
        --            if G.play.cards[i].config.center ~= G.P_CENTERS.c_base then
        --                G.play.cards[i]:set_ability(G.P_CENTERS.c_base, nil, true)
        --            end
        --            G.play.cards[i]:set_seal(nil, nil, true)
        --            G.play.cards[i]:set_edition(nil, true)
        --        end
        --        if G.play.cards[1].config.center ~= G.P_CENTERS.c_base then
        --            G.play.cards[1]:set_ability(G.P_CENTERS.c_base, nil, true)
        --        end
        --        G.play.cards[1]:set_seal(nil, nil, true)
        --        G.play.cards[1]:set_edition(nil, true)
        --        self.boss.trigger = true
        --    end
        --end
    end
}
return { name = {"Pit Blinds"}, items = {the_rains} }
