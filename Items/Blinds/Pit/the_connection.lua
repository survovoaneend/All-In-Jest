local the_connection = {
    object_type = "Blind",
    key = 'the_connection',
    boss = {
      min = 4,
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
        return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 0.5,
    boss_colour = HEX("b8c8cd"),
    ignore = true,
    atlas = 'blinds_pit',
    pos = {y = 24},
    order = 525,
    dollars = 6,
    config = {},

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        local exclude_contexts = context.individual or context.repetition or context.blueprint
        if context.end_of_round and not temp and not exclude_contexts then
            G.GAME.the_connection_extra_chips = G.GAME.the_connection_extra_chips or 0
            G.GAME.the_connection_extra_chips = G.GAME.the_connection_extra_chips + (G.GAME.chips - G.GAME.blind.chips)
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_connection} }
