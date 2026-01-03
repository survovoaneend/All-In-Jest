local the_horror = {
    object_type = "Blind",
    key = 'the_horror',
    boss = {
      min = 3,
    },
    mult = 2,
    boss_colour = HEX("58696c"),
    atlas = 'blinds',
    pos = {X = 0, y = 16 },
    order = 6,
    dollars = 5,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if G.jokers and context.before and G.GAME.current_round.hands_left == 0 and not temp then
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if not G.jokers.cards[i].ability.perishable and G.jokers.cards[i].config.center.perishable_compat and not G.jokers.cards[i].ability.eternal then
                    jokers[i] = G.jokers.cards[i]
                end
            end
            if #jokers > 0 then
                local temp_card = pseudorandom_element(jokers, pseudoseed('the_horror'))
                temp_card:set_perishable(true)
                temp_card:juice_up(0.3, 0.5)
                blind.triggered = true
            end
            blind:wiggle()
        end
    end
}

return { name = {"Blinds"}, items = {the_horror} }