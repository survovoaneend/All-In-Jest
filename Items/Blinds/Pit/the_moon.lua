local the_moon = {
    object_type = "Blind",
    key = 'the_moon',
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
    boss_colour = HEX("95a8a9"),
    atlas = 'blinds_pit',
    pos = { y = 3 },
    order = 504,
    dollars = 6,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if (context.after or context.setting_blind) and not temp then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function()
                    for k, v in pairs(G.playing_cards) do
                        if (context.after or context.setting_blind) then
                            if G.GAME.current_round.hands_left %2 == 1 then
                                SMODS.debuff_card(v, true, 'the_moon')
                            else
                                SMODS.debuff_card(v, false, 'the_moon')
                            end
                        end
                    end
                    return true 
                end
            )}))
        end
    end,

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_moon')
        end
    end,

    defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_moon')
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_moon} }
