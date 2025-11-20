local the_wound = {
    object_type = "Blind",
    key = 'the_wound',
    boss = {
        trigger = false,
        min = 2,
    },
    mult = 2,
    boss_colour = HEX("e1614c"),
    atlas = 'blinds',
    pos = { X = 0, y = 21 },
    order = 13,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end,
    debuff_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if G.GAME.current_round.discards_left == 0 then
            self.boss.trigger = true
        end
        if self.boss.trigger then
            return false     
        end
        return true
    end,

}
return { name = { "Blinds" }, items = { the_wound } }
