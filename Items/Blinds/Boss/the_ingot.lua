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
        local exclude_contexts = context.individual or context.repetition or context.blueprint
        if G.jokers and context.end_of_round and G.GAME.current_round.hands_left == 0 and not temp and not exclude_contexts then
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if not context.individual and not context.repetition and not G.jokers.cards[i].ability.perishable and not SMODS.is_eternal(G.jokers.cards[i]) then
                    G.jokers.cards[i]:add_sticker('eternal', true)
                    G.jokers.cards[i]:juice_up(0.3, 0.5)
                    blind.triggered = true
                    blind:wiggle()
                end
            end
        end
    end
}

return { name = {"Blinds"}, items = {the_ingot} }