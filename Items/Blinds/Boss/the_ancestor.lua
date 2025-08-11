local the_ancestor = {
    object_type = "Blind",
    key = 'the_ancestor',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("f03464"),
    atlas = 'blinds',
    pos = { X = 0, y = 61},
    order = 30,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_ancestor} }