local the_ingot = {
    object_type = "Blind",
    key = 'the_ingot',
    boss = {
      min = 5,
    },
    mult = 2,
    boss_colour = HEX("dfd8ca"),
    atlas = 'blinds',
    pos = {X = 0, y = 34 },
    order = 8,
    dollars = 5,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if G.jokers and context.before and G.GAME.current_round.hands_left == 0 and not temp then
            for i = 1, #G.jokers.cards do
                if not G.jokers.cards[i].ability.perishable and G.jokers.cards[i].config.center.eternal_compat then
                    G.jokers.cards[i]:set_eternal(true)
                    G.jokers.cards[i]:juice_up(0.3, 0.5)
                    blind.triggered = true
                end
            end
            blind:wiggle()
        end
    end
}

return { name = {"Blinds"}, items = {the_ingot} }