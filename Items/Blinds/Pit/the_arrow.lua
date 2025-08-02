local the_arrow = {
    object_type = "Blind",
    key = 'the_arrow',
    boss = {
      min = 4,
      score_requirement = 0,
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
    boss_colour = HEX("967465"),
    atlas = 'blinds',
    pos = { y = 12 },
    order = 513,
    dollars = 6,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.before and not temp then
            self.boss.trigger = false
        end
        if G.GAME.current_round.current_hand.chip_total and G.GAME.current_round.current_hand.chip_total > 0 and not temp and not self.boss.trigger then
            if G.GAME.current_round.current_hand.chip_total > self.boss.score_requirement then
                self.boss.score_requirement = G.GAME.current_round.current_hand.chip_total
            else
                G.GAME.current_round.current_hand.chip_total = 0
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_arrow} }
