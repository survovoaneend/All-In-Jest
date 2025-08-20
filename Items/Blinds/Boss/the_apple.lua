local the_apple = {
    object_type = "Blind",
    key = 'the_apple',
    boss = {
      min = 3,
    },
    mult = 2,
    boss_colour = HEX("ac3232"),
    atlas = 'blinds',
    pos = {X = 0, y = 36 },
    order = 10,
    dollars = 5,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.end_of_round and G.GAME.current_round.hands_played <= 1 and not temp then
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if not SMODS.is_eternal(G.jokers.cards[i]) then
                    jokers[i] = G.jokers.cards[i]
                end
            end
            local joker = jokers[1] or nil
            if joker then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        joker:start_dissolve()
                        return true
                    end
                }))
            end
        end
    end
}

return { name = {"Blinds"}, items = {the_apple} }