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
        if G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante or G.GAME.won then
            if G.GAME.stake >= 5 or G.GAME.won or not All_in_Jest.config.blue_stake_rework then
                return true
            end
        end
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

        if context.after and G.hand.cards and not temp then
            for k, v in pairs(G.hand.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        v:set_ability(G.P_CENTERS.m_stone, nil, true)
                        v:juice_up()
                        return true
                    end
                })) 
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_earth} }
