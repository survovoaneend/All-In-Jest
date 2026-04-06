local the_earth = {
    object_type = "Blind",
    key = 'the_earth',
    boss = {
      min = 4,
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
        return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 2,
    boss_colour = HEX("7b6a62"),
    atlas = 'blinds',
    pos = { y = 5 },
    order = 506,
    dollars = 6,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end

        if context.before and G.hand.cards and not temp then
            for _, v in pairs(G.hand.cards) do
                if not SMODS.has_enhancement(v, 'm_stone') then
                    blind.triggered = true
                    break
                end
            end
        end

        if context.after and G.hand.cards and not temp then
            G.E_MANAGER:add_event(Event({
                func = function()
                    blind:wiggle()
                    return true
                end
            }))
            for i, v in pairs(G.hand.cards) do
                local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
                if not SMODS.has_enhancement(v, 'm_stone') then
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.15,
                        func = function()
                            play_sound("tarot2", percent, 0.6)
                            v:set_ability(G.P_CENTERS.m_stone)
                            v:juice_up()
                            return true
                        end
                    }))
                end
            end
            blind.triggered = false
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_earth} }
