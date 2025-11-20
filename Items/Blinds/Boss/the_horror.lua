local the_horror = {
    object_type = "Blind",
    key = 'the_horror',
    boss = {
      min = 3,
    },
    mult = 2,
    boss_colour = HEX("58696c"),
    atlas = 'blinds',
    pos = {X = 0, y = 32 },
    order = 6,
    dollars = 5,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if G.jokers and context.end_of_round and G.GAME.current_round.hands_left == 0 and not temp then
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if not G.jokers.cards[i].ability.perishable and not SMODS.is_eternal(G.jokers.cards[i]) and not context.individual and not context.repetition then
                    jokers[i] = G.jokers.cards[i]
                end
            end
            if #jokers > 0 then
                local temp_card = pseudorandom_element(jokers, pseudoseed('the_horror'))
                temp_card:add_sticker('perishable', true)
                temp_card:juice_up(0.3, 0.5)
            end
        end
    end
}

return { name = {"Blinds"}, items = {the_horror} }