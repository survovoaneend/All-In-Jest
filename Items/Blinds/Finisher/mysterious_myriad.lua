local mysterious_myriad = {
    object_type = "Blind",
    key = 'mysterious_myriad',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    boss_colour = HEX("9e74a4"),
    ignore = true,
    atlas = 'blinds_final',
    pos = { y = 15},
    order = 1016,
    dollars = 8,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.after and not temp then
            local amt = 5 - #context.scoring_hand
            if #context.scoring_hand <= 5 then  
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        local minus_amt = math.floor(G.GAME.chips * (0.20 * amt))
                        ease_chips(G.GAME.chips - minus_amt)
                        return true
                    end
                }))
            end
            blind.triggered = true
        end
    end,
}
return { name = {"Finisher Blinds"}, items = {mysterious_myriad} }
