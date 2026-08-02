local wooden_wheel = {
    object_type = "Blind",
    key = 'wooden_wheel',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    boss_colour = HEX("9f7b60"),
    atlas = 'blinds_final',
    pos = { y = 22},
    order = 1023,
    dollars = 8,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.setting_blind and not temp then
            if #G.jokers.cards >= 1 then
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    play_sound('tarot1')
                    G.jokers.cards[1]:juice_up(0.3, 0.5)
                    return true
                end }))
                All_in_Jest.reroll_joker(G.jokers.cards[1], nil, 'wooden_wheel')
                if #G.jokers.cards >= 2 then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        play_sound('tarot1')
                        G.jokers.cards[#G.jokers.cards]:juice_up(0.3, 0.5)
                        return true
                    end }))
                    All_in_Jest.reroll_joker(G.jokers.cards[#G.jokers.cards], nil, 'wooden_wheel')
                end
            end
        end
    end,

    in_pool = function(self)
        if G.jokers then
            return #G.jokers.cards >= 1
        end
    end,
}
return { name = {"Finisher Blinds"}, items = {wooden_wheel} }
