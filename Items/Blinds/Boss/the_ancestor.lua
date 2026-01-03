local the_ancestor = {
    object_type = "Blind",
    key = 'the_ancestor',
    boss = {
        min = 3
    },
    mult = 2,
    boss_colour = HEX("f03464"),
    atlas = 'blinds',
    pos = { X = 0, y = 45},
    order = 30,
    dollars = 5,

    set_blind = function(self)
        G.GAME.current_round.aij_the_ancestor = {banned_hands = {}}
    end,
    disable = function(self)
        G.GAME.current_round.aij_the_ancestor = nil
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.pre_discard and not temp then
            local text,_ = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            G.GAME.current_round.aij_the_ancestor.banned_hands[#G.GAME.current_round.aij_the_ancestor.banned_hands+1] = text
        end
    end,
    debuff_hand = function(self, cards, hand, handname, check)
        local bool = false
        for i = 1, #G.GAME.current_round.aij_the_ancestor.banned_hands do
            if handname == G.GAME.current_round.aij_the_ancestor.banned_hands[i] then
                bool = true
            end
        end
        G.GAME.blind.triggered = bool
        return bool
    end,

    defeat = function(self)
        G.GAME.current_round.aij_the_ancestor = nil
    end,

}
return { name = {"Blinds"}, items = {the_ancestor} }