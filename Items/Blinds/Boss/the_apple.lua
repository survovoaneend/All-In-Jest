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

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        local exclude_contexts = context.individual or context.repetition or context.blueprint
        if context.end_of_round and G.GAME.current_round.hands_played <= 1 and not temp and not exclude_contexts then
            local destroyable_jokers = {}
            for i = 1, #G.jokers.cards do
                if not SMODS.is_eternal(G.jokers.cards[i]) then
                    table.insert(destroyable_jokers, G.jokers.cards[i])
                end
            end
            if #destroyable_jokers > 0 then
                SMODS.destroy_cards(destroyable_jokers[1])
                blind.triggered = true
                blind:wiggle()
            end
        end
    end
}

return { name = {"Blinds"}, items = {the_apple} }