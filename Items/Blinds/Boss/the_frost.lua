local the_frost = {
    object_type = "Blind",
    key = 'the_frost',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("d1d0dd"),
    atlas = 'blinds',
    pos = { X = 0, y = 58},
    order = 38,
    dollars = 5,


    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.after and not temp then
            local hand_card = pseudorandom_element(G.hand.cards, pseudoseed('jest_the_frost'..G.GAME.round_resets.ante))
            SMODS.destroy_cards(hand_card)
        end
    end

}
return { name = {"Blinds"}, items = {the_frost} }