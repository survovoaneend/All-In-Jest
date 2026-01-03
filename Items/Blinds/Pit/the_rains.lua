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
    atlas = 'blinds_pit',
    pos = { y = 1 },
    order = 502,
    dollars = 6,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end

        if context.before and G.hand.cards and not temp then
            for i = 1, #G.play.cards do
                if G.play.cards[i].config.center ~= G.P_CENTERS.c_base or G.play.cards[i].edition ~= nil or G.play.cards[i].seal ~= nil  then
                    blind.triggered = true
                    break
                end
            end
        end

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
                        local removed_edition = false
                        blind:wiggle()
                        for i = 1, #G.play.cards do
                            G.play.cards[i]:set_seal(nil, nil, true)
                            if G.play.cards[i].edition ~= nil then
                                removed_edition = true
                            end
                            G.play.cards[i]:set_edition(nil, true, true)
                            G.play.cards[i]:juice_up()
                        end
                        if removed_edition then
                            play_sound('whoosh2', 1.2, 0.6)
                        end
                        return true
                    end)
                }))
                blind.triggered = false
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_rains} }
