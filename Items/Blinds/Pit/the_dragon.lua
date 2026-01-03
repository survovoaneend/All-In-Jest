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
        return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 1,
    boss_colour = HEX("95a996"),
    atlas = 'blinds_pit',
    pos = { y = 6 },
    order = 507,
    dollars = 6,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if (G.GAME.current_round.hands_played > 0 or G.GAME.current_round.discards_used > 0) and G.hand.config.card_count ~= 0 and not context.repetition then
            return {
                cards_to_draw = 0,
            }
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_dragon} }
