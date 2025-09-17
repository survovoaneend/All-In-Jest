local the_need = {
    object_type = "Blind",
    key = 'the_need',
    in_pool = function(self)
        if G.GAME.dollars and to_number(G.GAME.dollars) >= 20 then
            return true
        else
            return false
        end
    end,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("98c350"),
    atlas = 'blinds',
    pos = { X = 0, y = 25},
    order = 34,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,
    debuff_hand = function(self, cards, hand, handname, check)
        if to_number(G.GAME.dollars) >= 20 then
            return false
        else
            return true
        end
    end

}
return { name = {"Blinds"}, items = {the_need} }