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

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        local exclude_contexts = context.individual or context.repetition or context.blueprint
        if context.end_of_round and not temp and not exclude_contexts then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local jokers_to_destroy = {}
                    for i = 1, #G.jokers.cards do
                        if All_in_Jest.is_food(G.jokers.cards[i]) then
                            table.insert(jokers_to_destroy, G.jokers.cards[i])
                        end
                    end
                    if #jokers_to_destroy > 0 then
                        SMODS.destroy_cards(jokers_to_destroy)
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