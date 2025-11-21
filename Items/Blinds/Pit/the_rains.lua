local the_rains = {
    object_type = "Blind",
    key = 'the_rains',
    boss = {
      min = 4,
      trigger = false,
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
      return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 2,
    boss_colour = HEX("869ca7"),
    atlas = 'blinds',
    pos = { y = 1 },
    order = 502,
    dollars = 6,

    calculate = function(self, blind, context)
        if context.all_in_jest and context.all_in_jest.before_after then
            local chipsthing = G.GAME.chips + context.total_chips >= G.GAME.blind.chips
            if chipsthing then
                for i = 1, #G.play.cards do
                    if G.play.cards[i].config.center ~= G.P_CENTERS.c_base then
                        G.play.cards[i]:set_ability(G.P_CENTERS.c_base, nil, true)
                    end
                end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = (function() 
                        for i = 1, #G.play.cards do
                            G.play.cards[i]:set_seal(nil, nil, true)
                            G.play.cards[i]:set_edition(nil, true)
                        end
                        return true
                    end)
                }))
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_rains} }
