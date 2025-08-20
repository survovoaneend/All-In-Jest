local the_beast = {
    object_type = "Blind",
    key = 'the_beast',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("4a834c"),
    atlas = 'blinds',
    pos = { X = 0, y = 52},
    order = 32,
    dollars = 5,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.end_of_round and not temp then
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i = 1, #G.jokers.cards do
                        if All_in_Jest.is_food(G.jokers.cards[i]) then
                            G.jokers.cards[i]:start_dissolve()
                        end
                    end
                    return true
                end
            }))
        end
    end,
    in_pool = function(self)
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if All_in_Jest.is_food(G.jokers.cards[i]) then
                    return true
                end
            end
            return false
        end
    end,
}
return { name = {"Blinds"}, items = {the_beast} }