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
    attributes = {'xscore'},
    boss_colour = HEX("9e74a4"),
    atlas = 'blinds_final',
    pos = { y = 15},
    order = 1016,
    dollars = 8,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.all_in_jest and context.all_in_jest.before_round_end_check and not temp then
            local amt = 5 - #context.scoring_hand
            if #context.scoring_hand <= 5 then  
                local minus_amt = math.floor(context.total_chips * (0.20 * amt))
                ease_chips(context.total_chips - minus_amt)
            end
            blind.triggered = true
        end
    end,
}
return { name = {"Finisher Blinds"}, items = {mysterious_myriad} }
