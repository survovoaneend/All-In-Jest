local the_ancestor = {
    object_type = "Blind",
    key = 'the_ancestor',
    boss = {
        min = 3,
        banned_hands = {},
    },
    mult = 2,
    boss_colour = HEX("f03464"),
    atlas = 'blinds',
    pos = { X = 0, y = 61},
    order = 30,
    dollars = 5,


    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.pre_discard and not temp then
            local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            self.boss.banned_hands[#self.boss.banned_hands+1] = text
        end
    end,
    debuff_hand = function(self, cards, hand, handname, check)
        local bool = false
        for i = 1, #self.boss.banned_hands do
            if handname == self.boss.banned_hands[i] then
                bool = true
            end
        end
        return bool
    end

}
return { name = {"Blinds"}, items = {the_ancestor} }