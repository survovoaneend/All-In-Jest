local the_hazel = {
    object_type = "Blind",
    key = 'the_hazel',
    boss = {
      min = 2,
    },
    mult = 2,
    boss_colour = HEX("a5722c"),
    atlas = 'blinds',
    pos = {X = 0, y = 35 },
    order = 9,
    dollars = 5,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.end_of_round and not temp then
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if not G.jokers.cards[i].ability.rental and not context.individual and not context.repetition then
                    jokers[i] = G.jokers.cards[i]
                end
            end
            if #jokers > 0 then
                local temp_card = pseudorandom_element(jokers, pseudoseed('the_hazel'))
                temp_card:add_sticker('rental', true)
                temp_card:juice_up(0.3, 0.5)
            end
        end
    end
}

return { name = {"Blinds"}, items = {the_hazel} }