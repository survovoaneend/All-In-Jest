local the_bullion = {
    object_type = "Blind",
    key = 'the_bullion',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("f3aa46"),
    atlas = 'blinds',
    pos = { X = 0, y = 43},
    order = 22,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_bullion} }