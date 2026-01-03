local the_pear = {
    object_type = "Blind",
    key = 'the_pear',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("84b1d2"),
    atlas = 'blinds',
    pos = { X = 0, y = 34},
    order = 41,
    dollars = 5,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.final_scoring_step and context.cardarea == G.hand and not temp then
            for i = 1, #G.hand.cards do
                G.hand.cards[i]:flip()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.cards[i]:set_base(pseudorandom_element(G.P_CARDS, pseudoseed('the_pear')))
                        G.hand.cards[i]:flip()
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                    end
                }))
            end
        end
    end,

}
return { name = {"Blinds"}, items = {the_pear} }