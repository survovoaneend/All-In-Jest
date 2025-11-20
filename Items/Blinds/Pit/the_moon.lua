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
        if G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante or G.GAME.won then
            if G.GAME.stake >= 5 or G.GAME.won or not All_in_Jest.config.blue_stake_rework then
                return true
            end
        end
    end,
    mult = 2,
    boss_colour = HEX("95a8a9"),
    atlas = 'blinds',
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
