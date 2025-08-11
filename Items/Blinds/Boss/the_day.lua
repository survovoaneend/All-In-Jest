local the_day = {
    object_type = "Blind",
    key = 'the_day',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("fda9c0"),
    atlas = 'blinds',
    pos = { X = 0, y = 62},
    order = 35,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_day} }