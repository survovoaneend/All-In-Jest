local the_wound = {
    object_type = "Blind",
    key = 'the_wound',
    boss = {
        min = 2,
    },
    mult = 2,
    boss_colour = HEX("e1614c"),
    atlas = 'blinds',
    pos = { X = 0, y = 7 },
    order = 13,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end,
    debuff_hand = function(self, cards, hand, handname, check)
        if G.GAME.current_round.discards_left > 0 then
            G.GAME.blind.triggered = true
            return true
        end
    end,

}
return { name = { "Blinds" }, items = { the_wound } }
